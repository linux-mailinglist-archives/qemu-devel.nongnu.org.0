Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 744FC6D02BB
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 13:14:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phqEP-0006ju-2g; Thu, 30 Mar 2023 07:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu@bonslack.org>) id 1phqEM-0006jP-Qs
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:14:10 -0400
Received: from bonnix.bonnix.it ([2a00:dcc0:dead:b9ff:fede:feed:2935:e3c8])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu@bonslack.org>) id 1phqEK-00043C-8s
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:14:10 -0400
Received: from [10.0.0.70] (dynamic-adsl-84-221-84-105.clienti.tiscali.it
 [84.221.84.105]) (authenticated bits=0)
 by bonnix.bonnix.it (8.14.4/8.14.4) with ESMTP id 32UBDxXt021028
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
 Thu, 30 Mar 2023 13:14:00 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 bonnix.bonnix.it 32UBDxXt021028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bonslack.org;
 s=20220805; t=1680174840;
 bh=H+lfis/GLIzb6Nbp6+Svf8SB6BXeQ8Edf9isbopRMYk=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=KzlBbzAPxYLbEKjiZUNHileu4grVXAV2WbE4/kr8dWMZGWn3Pm9wWdVBtlu8XpjWJ
 6cqgFlMLiyeczhc8+dU9OsV/IiowaZT49OxlPWsFYiwY5OmYj5ox3gf6JHz1bux8ub
 JbX/cPoiSGW+vkZJtBFMrXldLAImVPF5FrSFTTwQ=
Message-ID: <e82e940f-12cf-5c88-0603-37974c4a84df@bonslack.org>
Date: Thu, 30 Mar 2023 13:13:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: stat64 wrong on sparc64 user
To: Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <db07e036-cc5f-c9ad-b63c-10fdd5404830@bonslack.org>
 <bdebe626-e552-affb-b756-02c70898bdd6@redhat.com>
 <d49d441a-01a6-d38d-2bc8-98b9658a288e@bonslack.org>
 <60a7075e-64fd-674a-900c-94ec4ee0b6db@vivier.eu>
Content-Language: it, en-US
From: Luca Bonissi <qemu@bonslack.org>
In-Reply-To: <60a7075e-64fd-674a-900c-94ec4ee0b6db@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:dcc0:dead:b9ff:fede:feed:2935:e3c8;
 envelope-from=qemu@bonslack.org; helo=bonnix.bonnix.it
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 29/03/23 18:22, Laurent Vivier wrote:
> Le 28/03/2023 à 14:22, Luca Bonissi a écrit :
>> On 28/03/23 13:55, Thomas Huth wrote:
>>> On 28/03/2023 13.48, Luca Bonissi wrote:
>>>> --- qemu-20230327/linux-user/syscall_defs.h    2023-03-27 
>>>> 15:41:42.000000000 +0200
>>>> +++ qemu-20230327/linux-user/syscall_defs.h.new    2023-03-27 
>>>> 21:43:25.615115126 +0200
>>>> @@ -1450,7 +1450,7 @@ struct target_stat {
>>>>       unsigned int    st_dev;
>>>>       abi_ulong    st_ino;
>>>>       unsigned int    st_mode;
>>>> -    unsigned int    st_nlink;
>>>> +    short int    st_nlink;
>>>>       unsigned int    st_uid;
>>>
>>
> 
> To have automatic alignment according to target ABI, you must use 
> abi_XXX type (see include/exec/user/abitypes.h)
> 

I tried to keep as much as possibile the source code untouched, but no 
problem to change all fields with abi_XXX. Tested for sparc and sparc64:

--- qemu-20230327/linux-user/syscall_defs.h.orig	2023-03-27 
15:41:42.000000000 +0200
+++ qemu-20230327/linux-user/syscall_defs.h	2023-03-30 
12:52:46.308640526 +0200
@@ -1447,13 +1447,13 @@ struct target_eabi_stat64 {

  #elif defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
  struct target_stat {
-	unsigned int	st_dev;
+	abi_uint	st_dev;
  	abi_ulong	st_ino;
-	unsigned int	st_mode;
-	unsigned int	st_nlink;
-	unsigned int	st_uid;
-	unsigned int	st_gid;
-	unsigned int	st_rdev;
+	abi_uint	st_mode;
+	abi_short	st_nlink;
+	abi_uint	st_uid;
+	abi_uint	st_gid;
+	abi_uint	st_rdev;
  	abi_long	st_size;
  	abi_long	target_st_atime;
  	abi_long	target_st_mtime;
@@ -1465,25 +1465,23 @@ struct target_stat {

  #define TARGET_HAS_STRUCT_STAT64
  struct target_stat64 {
-	unsigned char	__pad0[6];
-	unsigned short	st_dev;
+	abi_ullong	st_dev;

-	uint64_t	st_ino;
-	uint64_t	st_nlink;
+	abi_ullong	st_ino;
+	abi_ullong	st_nlink;

-	unsigned int	st_mode;
+	abi_uint	st_mode;

-	unsigned int	st_uid;
-	unsigned int	st_gid;
+	abi_uint	st_uid;
+	abi_uint	st_gid;

-	unsigned char	__pad2[6];
-	unsigned short	st_rdev;
+	abi_uint	__pad0;
+	abi_ullong	st_rdev;

-        int64_t		st_size;
-	int64_t		st_blksize;
+	abi_llong	st_size;
+	abi_llong	st_blksize;

-	unsigned char	__pad4[4];
-	unsigned int	st_blocks;
+	abi_llong	st_blocks;

  	abi_ulong	target_st_atime;
  	abi_ulong	target_st_atime_nsec;
@@ -1501,13 +1499,13 @@ struct target_stat64 {

  #define TARGET_STAT_HAVE_NSEC
  struct target_stat {
-	unsigned short	st_dev;
+	abi_ushort	st_dev;
  	abi_ulong	st_ino;
-	unsigned short	st_mode;
-	short		st_nlink;
-	unsigned short	st_uid;
-	unsigned short	st_gid;
-	unsigned short	st_rdev;
+	abi_ushort	st_mode;
+	abi_short	st_nlink;
+	abi_ushort	st_uid;
+	abi_ushort	st_gid;
+	abi_ushort	st_rdev;
  	abi_long	st_size;
  	abi_long	target_st_atime;
  	abi_ulong	target_st_atime_nsec;
@@ -1522,39 +1520,37 @@ struct target_stat {

  #define TARGET_HAS_STRUCT_STAT64
  struct target_stat64 {
-	unsigned char	__pad0[6];
-	unsigned short	st_dev;
+	abi_ullong st_dev;

-	uint64_t st_ino;
+	abi_ullong st_ino;

-	unsigned int	st_mode;
-	unsigned int	st_nlink;
+	abi_uint	st_mode;
+	abi_uint	st_nlink;

-	unsigned int	st_uid;
-	unsigned int	st_gid;
+	abi_uint	st_uid;
+	abi_uint	st_gid;

-	unsigned char	__pad2[6];
-	unsigned short	st_rdev;
+	abi_ullong        st_rdev;

  	unsigned char	__pad3[8];

-        int64_t	st_size;
-	unsigned int	st_blksize;
+        abi_llong	st_size;
+	abi_uint	st_blksize;

  	unsigned char	__pad4[8];
-	unsigned int	st_blocks;
+	abi_uint	st_blocks;

-	unsigned int	target_st_atime;
-	unsigned int	target_st_atime_nsec;
+	abi_uint	target_st_atime;
+	abi_uint	target_st_atime_nsec;

-	unsigned int	target_st_mtime;
-	unsigned int	target_st_mtime_nsec;
+	abi_uint	target_st_mtime;
+	abi_uint	target_st_mtime_nsec;

-	unsigned int	target_st_ctime;
-	unsigned int	target_st_ctime_nsec;
+	abi_uint	target_st_ctime;
+	abi_uint	target_st_ctime_nsec;

-	unsigned int	__unused1;
-	unsigned int	__unused2;
+	abi_uint	__unused1;
+	abi_uint	__unused2;
  };

  #elif defined(TARGET_PPC)





