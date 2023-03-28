Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB876CBE16
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 13:50:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph7oq-0000Wr-5Y; Tue, 28 Mar 2023 07:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu@bonslack.org>) id 1ph7on-0000Wg-NT
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 07:48:49 -0400
Received: from bonnix.bonnix.it ([2a00:dcc0:dead:b9ff:fede:feed:2935:e3c8])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu@bonslack.org>) id 1ph7ol-00067s-I5
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 07:48:49 -0400
Received: from [10.0.0.70] (dynamic-adsl-84-221-84-105.clienti.tiscali.it
 [84.221.84.105]) (authenticated bits=0)
 by bonnix.bonnix.it (8.14.4/8.14.4) with ESMTP id 32SBmeTG016193
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
 Tue, 28 Mar 2023 13:48:40 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 bonnix.bonnix.it 32SBmeTG016193
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bonslack.org;
 s=20220805; t=1680004121;
 bh=kksNNgU8hRVufok6O9UWZgDcGnrpadOipbzS1JUD0R4=;
 h=Date:From:Subject:To:From;
 b=Kge5zY373YjRf1U/uvZewJ8stwasnSLDrPgVmNpqWw4oyHqX2cSo2Xxui9N06f+B3
 c9CIs7IHJITAZ3FKCut9JWVQFkKwWq1qRbmzQnTliMIGu7FUunnh9o6UfnfnBPviGY
 oKqcC9BLGo4d3BTL8I2s3lQTiF3pjIe2tyJECLDo=
Message-ID: <db07e036-cc5f-c9ad-b63c-10fdd5404830@bonslack.org>
Date: Tue, 28 Mar 2023 13:48:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Luca Bonissi <qemu@bonslack.org>
Subject: stat64 wrong on sparc64 user
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Content-Language: it, en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:dcc0:dead:b9ff:fede:feed:2935:e3c8;
 envelope-from=qemu@bonslack.org; helo=bonnix.bonnix.it
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On qemu-sparc64 (userspace) the struct "target_stat64" is not correctly 
padded, so the field st_rdev is not correctly aligned and will report 
wrong major/minor (e.g. for /dev/zero it reports 0,0x10500000 instead of 
1,5).

Here patch to solve the issue (it also fixes incorrect size on some fields):

--- qemu-20230327/linux-user/syscall_defs.h	2023-03-27 
15:41:42.000000000 +0200
+++ qemu-20230327/linux-user/syscall_defs.h.new	2023-03-27 
21:43:25.615115126 +0200
@@ -1450,7 +1450,7 @@ struct target_stat {
  	unsigned int	st_dev;
  	abi_ulong	st_ino;
  	unsigned int	st_mode;
-	unsigned int	st_nlink;
+	short int	st_nlink;
  	unsigned int	st_uid;
  	unsigned int	st_gid;
  	unsigned int	st_rdev;
@@ -1465,8 +1465,7 @@ struct target_stat {

  #define TARGET_HAS_STRUCT_STAT64
  struct target_stat64 {
-	unsigned char	__pad0[6];
-	unsigned short	st_dev;
+	uint64_t	st_dev;

  	uint64_t	st_ino;
  	uint64_t	st_nlink;
@@ -1476,14 +1475,13 @@ struct target_stat64 {
  	unsigned int	st_uid;
  	unsigned int	st_gid;

-	unsigned char	__pad2[6];
-	unsigned short	st_rdev;
+	unsigned int	__pad0;
+	uint64_t	st_rdev;

          int64_t		st_size;
  	int64_t		st_blksize;

-	unsigned char	__pad4[4];
-	unsigned int	st_blocks;
+	int64_t		st_blocks;

  	abi_ulong	target_st_atime;
  	abi_ulong	target_st_atime_nsec;
@@ -1522,8 +1520,7 @@ struct target_stat {

  #define TARGET_HAS_STRUCT_STAT64
  struct target_stat64 {
-	unsigned char	__pad0[6];
-	unsigned short	st_dev;
+	uint64_t st_dev;

  	uint64_t st_ino;

@@ -1533,8 +1530,7 @@ struct target_stat64 {
  	unsigned int	st_uid;
  	unsigned int	st_gid;

-	unsigned char	__pad2[6];
-	unsigned short	st_rdev;
+	uint64_t        st_rdev;

  	unsigned char	__pad3[8];


