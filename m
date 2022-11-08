Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B7D620BAB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 10:01:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osKSg-0007HP-Is; Tue, 08 Nov 2022 04:00:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1osKSZ-0007Gb-BZ
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:00:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1osKSX-0001Fx-SH
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 03:59:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667897992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r1mWmcOObusi7A2ctgjwJ4kKytdNExMPbNOanO5NlRQ=;
 b=ifJBC5fcdBtYkCdvDj+r2USGgNg2/i9T0ug3hgX8XNLEXP+8cB8lfh5JIUwUaUgkBVs60u
 0Lh66vFLzOOQ4b3LaW3vWIZpCATfz0QqULmj1IQaYbmNrWTqQx1mJNUId9Ee3E1P8i+hrF
 piApvOPmXTFEHFSwg7Tmx1FStDqzdds=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-141-N5-Xtk1BNmC-2MWIt4We0w-1; Tue, 08 Nov 2022 03:59:51 -0500
X-MC-Unique: N5-Xtk1BNmC-2MWIt4We0w-1
Received: by mail-wr1-f69.google.com with SMTP id
 t12-20020adfa2cc000000b0022adcbb248bso3726244wra.1
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 00:59:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r1mWmcOObusi7A2ctgjwJ4kKytdNExMPbNOanO5NlRQ=;
 b=6vpTVWGcJ3BhWE2srF6StR2Ui50oJDqjhgLXTgvUu/3HZiVNVAiMN3wt7f8WlClU/w
 M+UdjaPawXT2OjOHuQynV23h/RFag2Ht4G9lo2si++jVJBhII22yOUSjbaCBF37qK9dM
 0W5o3UC7OMPIoO+/Hh62JCsJtoz4H/GlIE4ErXY6PZCp8uMXpIccLSiu/3iIIr0HZRy4
 /sTf2ZmpUt/c0NPwDgp/QYxayyMDpbHC/bru2CwhE/DU4JsB0x0qdpjrKzjLmU4uWX41
 cnaQPbZgaTvY81bqrHVIAiIkIkWe1ld6qgBuMv2SZ9P7GGzPsx3aykxlEoHKt4YjmUbE
 lPxQ==
X-Gm-Message-State: ACrzQf2iWQ/Z8c+G1B4+mHizLYAeL3tM8Fy2+VYea7ZXvKjRfKJvyvA9
 Q1JtWTvauzOEosY9ueQFV2uDO7RNKnIlGpdr1DmwxHLZJRuA++kXVoMkLM3lKzwRIVIutaw3W68
 9olBIKcV+MiSnTZI=
X-Received: by 2002:adf:feca:0:b0:236:b258:c19b with SMTP id
 q10-20020adffeca000000b00236b258c19bmr34364786wrs.57.1667897990302; 
 Tue, 08 Nov 2022 00:59:50 -0800 (PST)
X-Google-Smtp-Source: AMsMyM65UKkJkhwhqTRIGkrU4ui8Twtx3jn/WZ8WPJfs4R7NZUfEBPVvOmudp9Dh/3kV3bJ3o69zXQ==
X-Received: by 2002:adf:feca:0:b0:236:b258:c19b with SMTP id
 q10-20020adffeca000000b00236b258c19bmr34364775wrs.57.1667897990122; 
 Tue, 08 Nov 2022 00:59:50 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003b435c41103sm6326145wmo.0.2022.11.08.00.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 00:59:49 -0800 (PST)
Message-ID: <516f943b-b741-3111-39f2-64aa6b69f0f4@redhat.com>
Date: Tue, 8 Nov 2022 09:59:48 +0100
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
 <92cea786-0a5d-1ddd-68d5-14ca98143614@suse.de>
 <6d6d0704-de37-db36-223e-f770311c70fd@redhat.com>
 <2cdf742a-b756-e586-229b-a27ceea4dfd8@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <2cdf742a-b756-e586-229b-a27ceea4dfd8@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 08/11/2022 09.52, Claudio Fontana wrote:
> On 11/8/22 09:42, Thomas Huth wrote:
>> On 07/11/2022 13.27, Claudio Fontana wrote:
>>> should -net and -netdev be adapted too?
>>
>> "-netdev help" already works just fine ... and "-net" should IMHO rather be
>> removed than improved ;-)
>>
>>    Thomas
>>
> 
> I wonder if it could be done once for all, in net_init_clients,
> instead of repeating the is_help_option in net_init_netdev and net_param_nic
> (and that would take care of net_init_client too, so we'd get "net" for free)..

I don't think that it makes too much sense to have one option for all - 
since all three CLI options are slightly different anyway. E.g. "-net nic" 
only exists for "-net", "hubport" cannot be used with "-net", "-nic" can 
also be used to configure the NIC model, etc.

  Thomas


