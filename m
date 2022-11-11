Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3B662582C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 11:24:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otRCV-0003KL-Jx; Fri, 11 Nov 2022 05:23:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otRCS-0003GB-OM
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:23:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otRCP-0006g5-Ia
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:23:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668162228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V/LlTakQoaU6SBeB+dDpPDJE4nuxwfR4zIGp0SXjCx0=;
 b=ZfNx5LWvuVz5m2DPQnuAVYtQGO8Ixa4jfQt9Z6Vw2bGIFrbeZjKBsh2oKxATdZ5X+lhpjk
 bNWCERPl5pUxMZzwLG49PSsBuBinGfRjYetHYO4ytdsl6z5+iSxlAdM86hBE/MHRFGe7mp
 iHqZlXWWYhyO8AQCMl/MOBDkF8fTUkE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-572-nTJQUny_Oj2jIiADW4ee_A-1; Fri, 11 Nov 2022 05:23:47 -0500
X-MC-Unique: nTJQUny_Oj2jIiADW4ee_A-1
Received: by mail-qk1-f198.google.com with SMTP id
 az31-20020a05620a171f00b006fa2cc1b0bfso4433546qkb.23
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 02:23:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V/LlTakQoaU6SBeB+dDpPDJE4nuxwfR4zIGp0SXjCx0=;
 b=zGa6pBwknx2fgFswwbKNyADOz64rcqpB5gR4b9z11f3E4YM15jXDChmf5b4zP6BeeD
 TAC2sR5gzZoRy3V+r0sawfuZpz0CMBAebJMNx0ek4fxOMpQEClHuQpfzkNFLhYsL5mGs
 BU0UQUArt+4xRs+B+tW8JsS0Qk8Yv4AB1D21UGyNtLoudZEOVUJHhDs5oIk876IDhDcb
 krPHNtynRVqeNIVXZEWUhVPM1IGNMTJgPAS8uESA0PnO1x2fkHiwthcjcLIt9w96rbYD
 mqpD8H+8KrFmdfgnYNEeAaX+xLHi3NWTNMPLyYdcs1neUro+my5a90SPEZxlEuUcsQg5
 OOlQ==
X-Gm-Message-State: ANoB5pk9VnyJ6R7veHdsBCipUjeritTdO1V+0xH+1G5lVAiedv3TgpTF
 bsNx4uLrDVtWL+prOGeaeUa0hdVOjQHA0d0lyilYJu6o2CoBoN5i45r87dGRjWt3AIb4NJ+0PCE
 kzVJaY2kdCAhcDqs=
X-Received: by 2002:a05:622a:15ce:b0:3a5:1cea:bdb with SMTP id
 d14-20020a05622a15ce00b003a51cea0bdbmr679006qty.160.1668162226792; 
 Fri, 11 Nov 2022 02:23:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7ah7b8aSlJ5Z6MHzmePgGUk08RWZS8jyRIpuWeWYNOI0XeOX8t9slW/JpTRNUJTlMGPuBkCw==
X-Received: by 2002:a05:622a:15ce:b0:3a5:1cea:bdb with SMTP id
 d14-20020a05622a15ce00b003a51cea0bdbmr678995qty.160.1668162226543; 
 Fri, 11 Nov 2022 02:23:46 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a05620a40c600b006fa12a74c53sm1216139qko.61.2022.11.11.02.23.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 02:23:46 -0800 (PST)
Message-ID: <e56a7d3f-e6d8-4c42-cd51-26a979eb9b23@redhat.com>
Date: Fri, 11 Nov 2022 11:23:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] util/qemu-config: Fix "query-command-line-options" to
 provide the right values
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20221109084431.47141-1-thuth@redhat.com>
In-Reply-To: <20221109084431.47141-1-thuth@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 09/11/2022 09.44, Thomas Huth wrote:
> The "query-command-line-options" command uses a hand-crafted list
> of options that should be returned for the "machine" parameter.
> This is pretty much out of sync with reality, for example settings
> like "kvm_shadow_mem" or "accel" are not parameters for the machine
> anymore. Also, there is no distinction between the targets here, so
> e.g. the s390x-specific values like "loadparm" in this list also
> show up with the other targets like x86_64.
> 
> Let's fix this now by geting rid of the hand-crafted list and by
> querying the properties of the machine class instead to assemble
> the list.
> 
> Fixes: 0a7cf217d8 ("fix regression of qmp_query_command_line_options")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
[...]
> +static CommandLineParameterInfoList *query_machine_properties(void)
> +{
> +    CommandLineParameterInfoList *param_list = NULL;
> +    CommandLineParameterInfo *info;
> +    ObjectPropertyIterator iter;
> +    ObjectProperty *prop;
> +    ObjectClass *oc;
> +
> +    oc = object_get_class(container_get(object_get_root(), "/machine"));
> +    assert(oc);

Hmmm, thinking about this again, it likely doesn't work that well either. 
libvirt uses the "none" machine to query the things that QEMU provides, so 
the properties of the individual machines won't show up this way... I guess 
I have to loop over all machine classes to collect all properties from all 
machines or something like that...?

  Thomas


