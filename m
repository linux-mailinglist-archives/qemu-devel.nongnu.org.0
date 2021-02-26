Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFA3326203
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 12:32:45 +0100 (CET)
Received: from localhost ([::1]:49062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFbMS-0000B5-W2
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 06:32:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFbKp-00084I-9x
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 06:31:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFbKn-0000jI-PP
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 06:31:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614339061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gl8GQR8wft3kqDEy0seiRlBOIGVufNvaPGSiicu5YWI=;
 b=ib+GKXZycL2n+JFTlenwRwn3AOzuPfRiaMIR4TOwxODuhTJQ1/kpsVmnknYlDqS8Ehyx8D
 d/YUZkZx514JnEswhW2LYCmInxWJ0WYuJ3/X+XbLzqggdi2GVsXtmPF3PuKPAYNiM93cWl
 BWWqKed0/IzXPbrIQxLx+MgLn07TlMY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-1ypaLn8VMOK8l0FEXyFiOw-1; Fri, 26 Feb 2021 06:30:59 -0500
X-MC-Unique: 1ypaLn8VMOK8l0FEXyFiOw-1
Received: by mail-wr1-f71.google.com with SMTP id h30so4616429wrh.10
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 03:30:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gl8GQR8wft3kqDEy0seiRlBOIGVufNvaPGSiicu5YWI=;
 b=lwKD3UkQHB82jUEO4RFqw1tN6jL1vB17v7mJOENSnoQ4uB+DiOety1aAM1F8M9s3sj
 W1cRrp1ZF7w/QsjQgW/h7ZbZyUgRiy1DGGqdrKODgGX+M3soj3gcjeD6qSquSW6GqyCL
 65vkAbLEZH+IynSaaw21GaUhf9nAIrVhKokjDafVSpQUNxh1J8Bm5zyunLbr89mDlqpJ
 1zhmev3A7sBkcoqMcJj6R96EruF3ODECVsDQZFJ9xkkRKL/3Al86CM/X/lTL/YEJDzfL
 0b90KMgHjQkBr8S9Rn38WVEOkPSp3ogpm08TWN4iSyZRyCGANOTcSLh2r+Yi43c0xS3A
 qsYA==
X-Gm-Message-State: AOAM533vS3OtxeWp8wZK/AdzGrl66bpaQ2OTfeAfaIScrua78K9fQMyG
 ZaegJNd0iUb00eb4jCbtrfEKVBUlW884oL5fcJw7YmmOQuZNuKHaluy+SF+LJeMU7QPiWCnbR/g
 LT46nAnVKi9FLd14=
X-Received: by 2002:adf:f743:: with SMTP id z3mr2092691wrp.304.1614339057911; 
 Fri, 26 Feb 2021 03:30:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeJW9T9rztvuQxqcz6cMLLHR3ZRbzeFeMGrJt/eUUtwF0J3KAWJEaZAarp4PPZm085YkTNNw==
X-Received: by 2002:adf:f743:: with SMTP id z3mr2092679wrp.304.1614339057714; 
 Fri, 26 Feb 2021 03:30:57 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g9sm10717033wmq.25.2021.02.26.03.30.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 03:30:56 -0800 (PST)
Subject: Re: [PATCH v2 19/31] qapi/qom: QAPIfy object-add
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-20-kwolf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e2114559-e0dd-a9bf-403c-a34874bb271d@redhat.com>
Date: Fri, 26 Feb 2021 12:30:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224135255.253837-20-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/02/21 14:52, Kevin Wolf wrote:
> +    v = qobject_output_visitor_new(&qobj);
> +    visit_type_ObjectOptions(v, NULL, &options, &error_abort);
> +    visit_complete(v, &qobj);
> +    visit_free(v);
> +
> +    props = qobject_to(QDict, qobj);
> +    qdict_del(props, "qom-type");
> +    qdict_del(props, "id");
> +
> +    v = qobject_input_visitor_new(QOBJECT(props));
> +    obj = user_creatable_add_type(ObjectType_str(options->qom_type),
> +                                  options->id, props, v, errp);
> +    object_unref(obj);

Please add a check in object_property_add_child that the id is well 
formed (using the id_wellformed function).  This is pre-existing, but it 
becomes a regression for -object later in the series.

Thanks,

Paolo


