Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3CC4EFBFC
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 23:07:30 +0200 (CEST)
Received: from localhost ([::1]:54186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naOUT-0007GJ-6s
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 17:07:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1naOTF-0006TJ-I4; Fri, 01 Apr 2022 17:06:13 -0400
Received: from smtp47.i.mail.ru ([94.100.177.107]:40582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1naOTD-0000r0-4d; Fri, 01 Apr 2022 17:06:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=qhdSLQZykmBDe/kInQV3f2VGrMaVvuyr0wPEyP/HkNs=; 
 t=1648847171;x=1649452571; 
 b=1fVb202TxnzHrHH5d/Io5VNFqPRIrd0LcThJBmdJuKaoTIE+Zs8JAYjoF2UXiWtEpXIHnTJYbmZd1so3C3jyhRAxC6zlnuu1nD5lSmUgcSxhfQaXkzzwoehoCB3X1wP6ZLQANb5OXKm4i+I4kHne5DeeroRqfQMfbWchqwFvGuE/UNGko+bWj1/jJpahBlAjeMZU1Ssb2cI7aIMiP0GortReGt/k/6vOJ1PHAx3rnOrJTqCALVyZdkRsdYx5mswALBio4PtO/JkbvP+JKaeYqcXwn26jEHKlmcjyci9Z29ps4IXdjrN8G8k5RUzPBsKpJ2Mq6Hn4ym1jek/nlge0Cg==;
Received: by smtp47.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1naOT8-0005Tb-FI; Sat, 02 Apr 2022 00:06:07 +0300
Message-ID: <d45130ce-5d91-59c5-124d-08d0ca65c5db@mail.ru>
Date: Sat, 2 Apr 2022 00:06:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 0/3] block/dirty-bitmaps: fix and improve bitmap merge
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com, vsementsov@openvz.org,
 nikita.lapshin@virtuozzo.com
References: <20220401100804.315728-1-vsementsov@openvz.org>
 <20220401201744.4353izghujwvt7mo@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220401201744.4353izghujwvt7mo@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp47.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD96DC212D1D15EACC4ACA8308985A3EC9B455786C35F6180B1182A05F5380850404C228DA9ACA6FE27D1C94A58760DB42AE33AD6544F6262CF8000E59F4C64F1CA03227BFAA76E8199
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72847AA60176ABEF3EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637C8BD49B17AF1FC7C8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D803959F4E51D38889209220F88968A0DC6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE77E7E81EEA8A9722B8941B15DA834481FA18204E546F3947C989FD0BDF65E50FBF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063783E00425F71A4181389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637D4ED24B89B06299ED81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE74B493DCC0B8C6538EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3BBEB9517EB7DA65B35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5E0E1B13F3B6BA82386845C4E2FADB75E47C350C5D6072177D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3403182E70AE6895E00FB8620224B5E212BEBFEAC2AB1B4DE0A2E8A5A04BD6615ED71DFBE875B0820E1D7E09C32AA3244C612BC74EE8DD364E8EB029A8ADF3421181560E2432555DBB27AC49D2B05FCCD8
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojhgUChjrcp6FNUDpocip1Dg==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE30A427191C13651D4077A9C7E55BBBFACE636541CB043412E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.107;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp47.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

01.04.2022 23:17, Eric Blake wrote:
> On Fri, Apr 01, 2022 at 01:08:01PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> v3: rebase on master, one patch is already merged.
>>
>> Vladimir Sementsov-Ogievskiy (3):
>>    block: block_dirty_bitmap_merge(): fix error path
>>    block: improve block_dirty_bitmap_merge(): don't allocate extra bitmap
>>    block: simplify handling of try to merge different sized bitmaps
> 
> Is any of this series worth getting into 7.0, or are we safe letting
> it slide to 7.1?
> 

Let's check.

Only first patch is a fix.

anon bitmap is created on same bs where dst is found, so they should be compatible in size.

But bdrv_merge_dirty_bitmap also do some checks on dst status, which may actually fail..

So, in bad case we set errp, but return non-NULL dst bitmap.

Look at callers of block_dirty_bitmap_merge:

1. qmp_block_dirty_bitmap_merge() is OK, it ignores return value.

2. qmp_transaction use local_err to detect error, so we'll go through error path, that's good. state->bitmap is set, but it's not really matter. What makes sense is state->backup set or not?

state->backup is initialized with zero, as qmp_transaction() use g_malloc0 to allocate state buffer.

And bdrv_merge_dirty_bitmap() will do all checks prior to call bdrv_dirty_bitmap_merge_internal(), which actually can set @backup. So, state->backup is not set in our bad case.

So that all should be OK to postpone for 7.1.

-- 
Best regards,
Vladimir

