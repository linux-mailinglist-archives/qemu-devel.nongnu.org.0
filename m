Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F55C49FC36
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 15:55:19 +0100 (CET)
Received: from localhost ([::1]:33866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDSeY-00052c-LE
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 09:55:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDSUu-0006Sg-E8
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:45:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDSUn-0007Fs-7f
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:45:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643381098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vF/yaRiby7+Qwna89teXCWKfPKLzq0vWZLNZ92cyKaA=;
 b=YIxFelNP/3ZaUBrHxmKEVpn+NTXoGMWHLyT8IH1VbTd8JZyDBawyS1lOwWV4QXS1XFKTsJ
 Z9JBn5769u5DZfgPnVU9WtOn62jP9fMiNbEvVoo35UrmBAJPi/vK8MQfWikrNS8TcqSIp1
 5bLNq52k4sIV8K6nJqS7rCKo4vxfokc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653--_J6ZrGSOkOwrwlnx-EZvQ-1; Fri, 28 Jan 2022 09:44:57 -0500
X-MC-Unique: -_J6ZrGSOkOwrwlnx-EZvQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 l15-20020ac84ccf000000b002cf9424cfa5so4654401qtv.7
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 06:44:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vF/yaRiby7+Qwna89teXCWKfPKLzq0vWZLNZ92cyKaA=;
 b=tZoE/xBnO7VtZsnUlRZ5pb0z7bF0qmX3/J/K4745LYrit9nJc5g5eepLneprFLERKA
 dNALN0mpA7Z/Hpg4+Zan24ic9XRjL+0QGHAlbzBFizNO0SjSLLoVXGcHx/svLEphuvi/
 nCLvPHWea6lDKAP7aOe7AmEVDpKtsqyrjRiCTTNg+7Ca4Sk2A7gFBmL0TV7oouPo4B6w
 iPvDDAQfsHVO8gbDW/O9JEZJL0r5b58cLivDRKh2LMWSmFhaR+lwI7VRHcjyG+ZhV5tD
 F61Y6zhoZjoU1dEvBZNRlCnXFze8lv0aS2wM66PCB5WcX2q11TMhqZY9iSKZgjqHjK9O
 EENg==
X-Gm-Message-State: AOAM530BweDKCqNS296Fxs1Yf5/574ETxo9ZHd7zLYI299XP53wB3qqX
 wBTOGYI02U1UcQK/Zrac61VYnhEtzAYUs8Zd52/IiYyJK+tyaLqNWpp770izxo+yQVqqhbj5YcK
 ss3j/Rwysjp0wYgo=
X-Received: by 2002:ac8:5e47:: with SMTP id i7mr6365324qtx.674.1643381097273; 
 Fri, 28 Jan 2022 06:44:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOFS2kPkOC1kFJo4RWh6q6mEvc4YJaToCBT6P4EY0GXkT/ehtiqHQJSTgcC6Npwup5hdEiGg==
X-Received: by 2002:ac8:5e47:: with SMTP id i7mr6365299qtx.674.1643381097044; 
 Fri, 28 Jan 2022 06:44:57 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id x16sm3090664qta.24.2022.01.28.06.44.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 06:44:56 -0800 (PST)
Message-ID: <1b9a6864-b3ea-3206-d85b-266729d03026@redhat.com>
Date: Fri, 28 Jan 2022 15:44:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 04/33] block/export/fuse.c: allow writable exports to
 take RESIZE permission
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-5-eesposit@redhat.com>
 <bc3fa04f-e384-e059-8aed-fe1c6ac4a2a6@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <bc3fa04f-e384-e059-8aed-fe1c6ac4a2a6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 25/01/2022 17:51, Hanna Reitz wrote:
> On 21.01.22 18:05, Emanuele Giuseppe Esposito wrote:
>> Allow writable exports to get BLK_PERM_RESIZE permission
>> from creation, in fuse_export_create().
>> In this way, there is no need to give the permission in
>> fuse_do_truncate(), which might be run in an iothread.
>>
>> Permissions should be set only in the main thread, so
>> in any case if an iothread tries to set RESIZE, it will
>> be blocked.
>>
>> Also assert in fuse_do_truncate that if we give the
>> RESIZE permission we can then restore the original ones,
>> since we don't check the return value of blk_set_perm.
> 

I will then just remove the last line in the commit message ("since ..
blk_set_perm.").

Thank you,
Emanuele

> We do, because we pass &error_abort for errp, so if an error were to
> occur, qemu would abort.
> 
> Not that I mind adding an assertion on the return value, just noting
> that we omitted that kind of intentionally.
> 
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> 
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   block/export/fuse.c | 25 ++++++++++++++++++-------
>>   1 file changed, 18 insertions(+), 7 deletions(-)
>>
>> diff --git a/block/export/fuse.c b/block/export/fuse.c
>> index 823c126d23..3c177b9e67 100644
>> --- a/block/export/fuse.c
>> +++ b/block/export/fuse.c
>> @@ -86,8 +86,8 @@ static int fuse_export_create(BlockExport *blk_exp,
>>         assert(blk_exp_args->type == BLOCK_EXPORT_TYPE_FUSE);
>>   -    /* For growable exports, take the RESIZE permission */
>> -    if (args->growable) {
>> +    /* For growable and writable exports, take the RESIZE permission */
>> +    if (args->growable || blk_exp_args->writable) {
>>           uint64_t blk_perm, blk_shared_perm;
>>             blk_get_perm(exp->common.blk, &blk_perm, &blk_shared_perm);
>> @@ -392,14 +392,23 @@ static int fuse_do_truncate(const FuseExport
>> *exp, int64_t size,
>>   {
>>       uint64_t blk_perm, blk_shared_perm;
>>       BdrvRequestFlags truncate_flags = 0;
>> -    int ret;
>> +    bool add_resize_perm;
>> +    int ret, ret_check;
>> +
>> +    /* Growable and writable exports have a permanent RESIZE
>> permission */
>> +    add_resize_perm = !exp->growable && !exp->writable;
>>         if (req_zero_write) {
>>           truncate_flags |= BDRV_REQ_ZERO_WRITE;
>>       }
>>   -    /* Growable exports have a permanent RESIZE permission */
>> -    if (!exp->growable) {
>> +    if (add_resize_perm) {
>> +
>> +        if (!qemu_in_main_thread()) {
>> +            /* Changing permissions like below only works in the main
>> thread */
>> +            return -EPERM;
>> +        }
>> +
>>           blk_get_perm(exp->common.blk, &blk_perm, &blk_shared_perm);
>>             ret = blk_set_perm(exp->common.blk, blk_perm |
>> BLK_PERM_RESIZE,
>> @@ -412,9 +421,11 @@ static int fuse_do_truncate(const FuseExport
>> *exp, int64_t size,
>>       ret = blk_truncate(exp->common.blk, size, true, prealloc,
>>                          truncate_flags, NULL);
>>   -    if (!exp->growable) {
>> +    if (add_resize_perm) {
>>           /* Must succeed, because we are only giving up the RESIZE
>> permission */
>> -        blk_set_perm(exp->common.blk, blk_perm, blk_shared_perm,
>> &error_abort);
>> +        ret_check = blk_set_perm(exp->common.blk, blk_perm,
>> +                                 blk_shared_perm, &error_abort);
>> +        assert(ret_check == 0);
>>       }
>>         return ret;
> 


