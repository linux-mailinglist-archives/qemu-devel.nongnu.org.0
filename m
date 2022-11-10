Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F376241AD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 12:43:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot5wn-000230-99; Thu, 10 Nov 2022 06:42:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot5wl-00021X-0X
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 06:42:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot5wj-0005A5-Fl
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 06:42:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668080532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BXlaJxrf4HnKzGxbdRyL2RJ9itg8kOkt0odnO8FNvoM=;
 b=JKfXF3kjZwTmEO6JoAHy+Mkp/mtJ+lDKEN58BQZeMmqcbUmzgxTnAbxG6lgO/bXMpuLVXb
 2dQn7LaEHAd4QS+GIUrO+0KoruLUZj4Rxbu7aZoUxwxBGAnRvVe2zE1OfWFQn7a9tI1Bsk
 p+XtUc1ss55kdreR2OxFoUkxaAnrc/o=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-568-liuF7nF-MFWxj64BDBCuPw-1; Thu, 10 Nov 2022 06:42:11 -0500
X-MC-Unique: liuF7nF-MFWxj64BDBCuPw-1
Received: by mail-pg1-f199.google.com with SMTP id
 h185-20020a636cc2000000b0046fc6e0065dso882435pgc.5
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 03:42:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BXlaJxrf4HnKzGxbdRyL2RJ9itg8kOkt0odnO8FNvoM=;
 b=sk4m1jHcANrBS9OAOAt1OTlGt1Sti0AmtHRaQuDXrCM+6hQtGhWEgoNTEwN5sIRn69
 zzl/Qq8/xUOiycc0wRPi2gEK7XT2U+FO0SvHK3fo5AC8mhpC52IQjap89S02FkGijskW
 mQvIA3U8BthYVubfVxo1bqnt7oUxH9B1lmv9jY+7HXRdl0FErBig5yMqTRST6eS6ZO8h
 zs0kBamfXaHjkNcSX+2YCOFjNuHgqAkiDf178PIPlry2P577rs7OaVLxH4lUktM5yBKl
 f6b6cwJtgidDgte35uzi5b5Zz8IfQHy4ZRgIHESKFuMucM/BRFKHEybMjIrhwsRy7Ej5
 P0/A==
X-Gm-Message-State: ACrzQf2x93IHrep+Y+PCkf5zWJlavHQrtxQSSaxWHfy77uB6PqSFGZUj
 fBPNBfAUhUTPJgQKnBBIsL5cxVLCyb/FkV9nQQczJXCk4koVPeUHiBBgU9VfKC4CW0Qt3Ctzf++
 hYr+hE1owFGuk1RI=
X-Received: by 2002:a17:902:e843:b0:186:b180:3c3a with SMTP id
 t3-20020a170902e84300b00186b1803c3amr65284581plg.66.1668080530512; 
 Thu, 10 Nov 2022 03:42:10 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5kizdnUcapZ9QjEpfBKh8DYuwkx6XA8CTyGDJjevwXuzpiDvfEBv56RbFax4u29IqGtsNguA==
X-Received: by 2002:a17:902:e843:b0:186:b180:3c3a with SMTP id
 t3-20020a170902e84300b00186b1803c3amr65284567plg.66.1668080530237; 
 Thu, 10 Nov 2022 03:42:10 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a655505000000b00434760ee36asm8865571pgr.16.2022.11.10.03.42.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 03:42:09 -0800 (PST)
Message-ID: <9a4db614-297d-a85f-9788-ed46c71bb66b@redhat.com>
Date: Thu, 10 Nov 2022 12:42:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/3] net: Restore printing of the help text with "-nic
 help"
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, pbonzini@redhat.com
References: <20221104125705.415923-1-thuth@redhat.com>
 <20221104125705.415923-3-thuth@redhat.com>
 <4a72c7c6-4b70-b6bf-705e-3303865066b6@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <4a72c7c6-4b70-b6bf-705e-3303865066b6@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 08/11/2022 10.49, Claudio Fontana wrote:
> On 11/4/22 13:57, Thomas Huth wrote:
>> Running QEMU with "-nic help" used to work in QEMU 5.2 and earlier versions
>> (it showed the available netdev backends), but this feature got broken during
>> some refactoring in version 6.0. Let's restore the old behavior, and while
>> we're at it, let's also print the available NIC models here now since this
>> option can be used to configure both, netdev backend and model in one go.
>>
>> Fixes: ad6f932fe8 ("net: do not exit on "netdev_add help" monitor command")
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   net/net.c | 14 ++++++++++++--
>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/net/net.c b/net/net.c
>> index c0516a8067..b4b8f2a9cc 100644
>> --- a/net/net.c
>> +++ b/net/net.c
>> @@ -1571,8 +1571,18 @@ static int net_param_nic(void *dummy, QemuOpts *opts, Error **errp)
>>       const char *type;
>>   
>>       type = qemu_opt_get(opts, "type");
>> -    if (type && g_str_equal(type, "none")) {
>> -        return 0;    /* Nothing to do, default_net is cleared in vl.c */
>> +    if (type) {
>> +        if (g_str_equal(type, "none")) {
>> +            return 0;    /* Nothing to do, default_net is cleared in vl.c */
>> +        }
>> +        if (is_help_option(type)) {
>> +            GPtrArray *nic_models = qemu_get_nic_models(TYPE_DEVICE);
>> +            show_netdevs();
>> +            printf("\n");
>> +            qemu_show_nic_models(type, (const char **)nic_models->pdata);
>> +            g_ptr_array_free(nic_models, true);
> 
> nit: would not the order:
> 
>> +            GPtrArray *nic_models;
>> +            show_netdevs();
>> +            printf("\n");
>> +            nic_models = qemu_get_nic_models(TYPE_DEVICE);
>> +            qemu_show_nic_models(type, (const char **)nic_models->pdata);
>> +            g_ptr_array_free(nic_models, true);
> 
> flow more logically?

I think that's mostly a matter of taste ... and as long as the declaration 
of the variable has to stay at the top of the block (according to QEMU's 
coding style), I think I'd also prefer to keep the initialization there.

  Thomas


