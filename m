Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83DE43CE37
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:03:41 +0200 (CEST)
Received: from localhost ([::1]:38164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflOu-0005nj-8e
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfkyM-0000YR-9x
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:36:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfkyJ-0008Py-PJ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:36:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635348970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1taKNRd/dhL4RUUlTjc/oI6kjIS/GXZZimFnv3Kyvls=;
 b=VzKW1y92Nv/uF/ttXBt79Oaow8WpoiLfnau3RnOVptafAqwRGV+UVQxXNNS/MLtxSAB13W
 AF14UU+5bui9EXSq/NssLW8iDCbgSelNEg3SVFJP3NCYd3Nnc3orjwWt2wGahWh49U+M0z
 G0KhWTYNS2jcaxZl/UW+5YVq/Jj9QGo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-ft8i8U8LMPez7scocJoWhQ-1; Wed, 27 Oct 2021 11:36:08 -0400
X-MC-Unique: ft8i8U8LMPez7scocJoWhQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 u15-20020a5d514f000000b001687ebddea3so806675wrt.8
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 08:36:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1taKNRd/dhL4RUUlTjc/oI6kjIS/GXZZimFnv3Kyvls=;
 b=qcZ/aI/PWt/kgNGHYaCrHABDY6M5s/z07EeWiB5p7PRbWToFK9bsUnbGBv54cn8MnO
 D9EyL9FX2K64UtP7ctNR2n5+H3roqSBhQNdkgrY9gM+70Gpuhv3L1yrqhf8Tj0lWgCiT
 cTGfWMEyKolrpoHnCHiThjJCs45echcbgJtmPc8PDLylbzUns9PMRfSzRSI+N/rF9brP
 bZOcESXIrmEOAJiB0cznyGx8hqsfp4zuI2VTi2Vy1wKsqo6qucZR3xrzMKg/9gXTem51
 4zbWmSWRphidJmES85iVrXtvIq86HCKTpGy/nefPf4cTDUi6UaZJeQ5qcNHYpYbWhb6F
 zYAQ==
X-Gm-Message-State: AOAM531sp72WA6GLg3q1fPffoOkE4Af20nwJJD3IfW4JCBl4cOFw4dRt
 0mVtzEIYK2p5DA1JyNfgu0+owfdiT0S6tYveWACMJmILcp5pcUZ0n0bJSdJoPLWEzkifZexH+4m
 zZ0fme+5+l5d5f00=
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr41933237wrd.63.1635348965380; 
 Wed, 27 Oct 2021 08:36:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3FrdOJWfGv3pFkL1cTeX10GaG0s5sFNvxv7h+MCkEH/ahFWMSng2RIk0M25RWveM7+Nm7Yw==
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr41933213wrd.63.1635348965177; 
 Wed, 27 Oct 2021 08:36:05 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id j9sm176687wrt.96.2021.10.27.08.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 08:36:04 -0700 (PDT)
Message-ID: <dd17a177-c7eb-b879-a980-a986344b9cac@redhat.com>
Date: Wed, 27 Oct 2021 17:36:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 0/8] 9p queue 2021-10-27
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1635340713.git.qemu_oss@crudebyte.com>
 <1763549.VT83FdeJ1q@silver>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <1763549.VT83FdeJ1q@silver>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Christian,

On 10/27/21 16:05, Christian Schoenebeck wrote:
> On Mittwoch, 27. Oktober 2021 15:18:33 CEST Christian Schoenebeck wrote:
>> The following changes since commit 931ce30859176f0f7daac6bac255dae5eb21284e:
>>
>>   Merge remote-tracking branch 'remotes/dagrh/tags/pull-virtiofs-20211026'
>> into staging (2021-10-26 07:38:41 -0700)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20211027
>>
>> for you to fetch changes up to 7e985780aaab93d2c5be9b62d8d386568dfb071e:
>>
>>   9pfs: use P9Array in v9fs_walk() (2021-10-27 14:45:22 +0200)
>>
>> ----------------------------------------------------------------
>> 9pfs: performance fix and cleanup
>>
>> * First patch fixes suboptimal I/O performance on guest due to previously
>>   incorrect block size being transmitted to 9p client.
>>
>> * Subsequent patches are cleanup ones intended to reduce code complexity.
>>
>> ----------------------------------------------------------------
>> Christian Schoenebeck (8):
>>       9pfs: fix wrong I/O block size in Rgetattr
>>       9pfs: deduplicate iounit code
>>       9pfs: simplify blksize_to_iounit()
>>       9pfs: introduce P9Array
>>       fsdev/p9array.h: check scalar type in P9ARRAY_NEW()
>>       9pfs: make V9fsString usable via P9Array API
>>       9pfs: make V9fsPath usable via P9Array API
>>       9pfs: use P9Array in v9fs_walk()
>>
>>  fsdev/9p-marshal.c |   2 +
>>  fsdev/9p-marshal.h |   3 +
>>  fsdev/file-op-9p.h |   2 +
>>  fsdev/p9array.h    | 160
>> +++++++++++++++++++++++++++++++++++++++++++++++++++++ hw/9pfs/9p.c       | 
>> 70 +++++++++++++----------
>>  5 files changed, 208 insertions(+), 29 deletions(-)
>>  create mode 100644 fsdev/p9array.h
> 
> Regarding last 5 patches: Daniel raised a concern that not using g_autoptr 
> would deviate from current QEMU coding patterns:
> https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg00081.html
> 
> Unfortunately I saw no way to address his concern without adding unnecessary 
> code complexity, so I decided to make this a 9p local type (QArray -> P9Array) 
> for now, which can easily be replaced in future (e.g. when there will be 
> something appropriate on glib side).

Hmm various patches aren't reviewed yet... In particular
patch #5 has a Suggested-by tag without Reviewed-by, this
looks odd.

See https://wiki.qemu.org/Contribute/SubmitAPullRequest:

  Don't send pull requests for code that hasn't passed review.
  A pull request says these patches are ready to go into QEMU now,
  so they must have passed the standard code review processes. In
  particular if you've corrected issues in one round of code review,
  you need to send your fixed patch series as normal to the list;
  you can't put it in a pull request until it's gone through.
  (Extremely trivial fixes may be OK to just fix in passing, but
  if in doubt err on the side of not.)


