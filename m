Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27C46CBEF3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 14:23:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph8LX-0005XY-MU; Tue, 28 Mar 2023 08:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu@bonslack.org>) id 1ph8LV-0005Wv-5W
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:22:37 -0400
Received: from bonnix.bonnix.it ([2a00:dcc0:dead:b9ff:fede:feed:2935:e3c8])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu@bonslack.org>) id 1ph8LS-0003Tu-To
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:22:36 -0400
Received: from [10.0.0.70] (dynamic-adsl-84-221-84-105.clienti.tiscali.it
 [84.221.84.105]) (authenticated bits=0)
 by bonnix.bonnix.it (8.14.4/8.14.4) with ESMTP id 32SCMUcM000600
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
 Tue, 28 Mar 2023 14:22:30 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 bonnix.bonnix.it 32SCMUcM000600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bonslack.org;
 s=20220805; t=1680006151;
 bh=fuiqcQYCf3r6RvSXYuQCmq6hsBP3YJR/++k5DOdiNEc=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=mQ/ycnyRshm86pLZx+FDJ2dmuBR0y9iVE09U2HW2nAqpllzSVX/jpQWnXk6zvkZJZ
 6ut6EVIdd+KdbSapsNq7x7UOZemCsKd3LuU3d14ZamqTEZv8CEGt6bl+g6goao6xGn
 NVqETfZhqmKljKw0DbF9cxb5k6EvSVqSzxPv8gAE=
Message-ID: <d49d441a-01a6-d38d-2bc8-98b9658a288e@bonslack.org>
Date: Tue, 28 Mar 2023 14:22:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: stat64 wrong on sparc64 user
Content-Language: it, en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <db07e036-cc5f-c9ad-b63c-10fdd5404830@bonslack.org>
 <bdebe626-e552-affb-b756-02c70898bdd6@redhat.com>
From: Luca Bonissi <qemu@bonslack.org>
In-Reply-To: <bdebe626-e552-affb-b756-02c70898bdd6@redhat.com>
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

On 28/03/23 13:55, Thomas Huth wrote:
> On 28/03/2023 13.48, Luca Bonissi wrote:
>> --- qemu-20230327/linux-user/syscall_defs.h    2023-03-27 
>> 15:41:42.000000000 +0200
>> +++ qemu-20230327/linux-user/syscall_defs.h.new    2023-03-27 
>> 21:43:25.615115126 +0200
>> @@ -1450,7 +1450,7 @@ struct target_stat {
>>       unsigned int    st_dev;
>>       abi_ulong    st_ino;
>>       unsigned int    st_mode;
>> -    unsigned int    st_nlink;
>> +    short int    st_nlink;
>>       unsigned int    st_uid;
> 
> That looks wrong at a first glance. IIRC Sparc is a very strictly 
> aligned architecture, so if the previous field "st_mode" was aligned to 
> a 4-byte boundary, the "st_uid" field now would not be aligned 
> anymore... are you sure about this change? Maybe it needs a padding 
> field now?

The padding is automatic (either on Sparc or x86-64): short will be 
aligned to 2-byte boundary, int will be aligned to 4-byte boundary, long 
will be aligned to 8-byte boundary.

E.g.:
st_dev=0x05060708;
st_ino=0x1112131415161718;
st_mode=0x1a1b1c1d;
st_nlink=0x2728;
st_uid=0x2a2b2c2d;
st_gid=0x3a3b3c3d;
st_rdev=0x35363738;
st_size=0x4142434445464748;
st_blksize=0x5152535455565758;

will result (sparc64 - big endian):
00: 05 06 07 08 00 00 00 00
08: 11 12 13 14 15 16 17 18
10: 1A 1B 1C 1D 27 28 00 00
18: 2A 2B 2C 2D 3A 3B 3C 3D
20: 35 36 37 38 00 00 00 00
28: 41 42 43 44 45 46 47 48
30: 00 00 00 00 00 00 00 00
38: 00 00 00 00 00 00 00 00
40: 00 00 00 00 00 00 00 00
48: 51 52 53 54 55 56 57 58
50: 00 00 00 00 00 00 00 00
58: 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00

Or on x86-64 (little endian):
00: 08 07 06 05 00 00 00 00
08: 18 17 16 15 14 13 12 11
10: 1D 1C 1B 1A 28 27 00 00
18: 2D 2C 2B 2A 3D 3C 3B 3A
20: 38 37 36 35 00 00 00 00
28: 48 47 46 45 44 43 42 41
30: 00 00 00 00 00 00 00 00
38: 00 00 00 00 00 00 00 00
40: 00 00 00 00 00 00 00 00
48: 58 57 56 55 54 53 52 51
50: 00 00 00 00 00 00 00 00
58: 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00

Please note the automatic padding between "st_dev" and "st_ino" (offset 
0x04, 4 bytes), "st_nlink" and "st_uid" (offset 0x16, 2 bytes), 
"st_rdev" and "st_size" (offset 0x24, 4 bytes).

Placing st_nlink as int would result in incorrect big/little endian 
conversion, so it should be set as short. If you like clearer source 
code, you can optionally add padding, but it is not mandatory.

Thanks!
   Luca




