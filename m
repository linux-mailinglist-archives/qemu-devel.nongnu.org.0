Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B3841ED41
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 14:22:04 +0200 (CEST)
Received: from localhost ([::1]:35464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWHY9-0003Mx-K2
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 08:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mWHVw-0001fN-AZ
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 08:19:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mWHVs-0004O8-H4
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 08:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633090778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qmXQUa3VerOj23+cSMt79/t4YiYsXOdT/TbZ5NIitRw=;
 b=Y4qW8NvEGvBTb4f+4fv4pnkgx6yO70GVixCHs6tR/uGb3rNJ3cdRj9VqCKsPstMGaclvnH
 Ze4RG3J6dLhjWriSiFK5kpBlRxexfPwpi75xsT60SXTSUhUNIXAkM9e3HiUbMtUotaSoFa
 nsNN+nFJjn9i2wBG0+jOIauqiXQLeug=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-dddGtuqjMbKCS4JSdn_KdQ-1; Fri, 01 Oct 2021 08:19:37 -0400
X-MC-Unique: dddGtuqjMbKCS4JSdn_KdQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 z6-20020a50cd06000000b003d2c2e38f1fso10210135edi.1
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 05:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qmXQUa3VerOj23+cSMt79/t4YiYsXOdT/TbZ5NIitRw=;
 b=3jWYZGxwNMX2BO1vjn9ij9+rbJgcoA3pIwNHYLAUWF7wB9sEELbO5xFlwX8C+pCWuA
 GM2YFPXk5UqgTwlD9NmgvTuPxyhdNOJfPAqd/UqKoSCfrEr6vev2zuU4PYco2HGozCb8
 mhbPmGFkdZfDsV4SG3NVczKS1PxV/6sJe9UsE9JyYOzoQUrYHYe0ZiPjeFCRFqDND1jH
 6kkLTpjqfFkV+898ppGZ6kg7Gz/kFJ8dC8e8tXqpOXB8sVRAGJ9urSVzE1RIAa4SPwPe
 jB2Av5DrlUZZnsdH/lI/S9vw0xosZ/a2/wDTbBlQtDtuNXfLAfPzouqksVRqFDmjbZ9/
 MKkg==
X-Gm-Message-State: AOAM533muE/p4jq1wUze0OFpaJnXBUt0eu83m4D5MFfoako5C2P+kDyw
 XX6/bEAmsy8IxgFIPO+i8RHFjeOmdiWbpSS2ySWHT3OOa11P03QSXehb/Z/6NKbEeurWQf+/6bE
 i3lT/54bdeI12L4o=
X-Received: by 2002:aa7:c4ce:: with SMTP id p14mr14141718edr.129.1633090776255; 
 Fri, 01 Oct 2021 05:19:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZSpQE3WKTmueMwE6XxCxI7JHjYcvbTvGIAB3oeGiK6hjGF82aeL37H+uhADpPVR0pCTK0dQ==
X-Received: by 2002:aa7:c4ce:: with SMTP id p14mr14141699edr.129.1633090775987; 
 Fri, 01 Oct 2021 05:19:35 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id l13sm3029103edq.76.2021.10.01.05.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 05:19:35 -0700 (PDT)
Message-ID: <232effd7-81d9-76df-7ca3-42406c5ec9de@redhat.com>
Date: Fri, 1 Oct 2021 14:19:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/7] docs: name included files ".rst.inc"
To: Markus Armbruster <armbru@redhat.com>
References: <20210930133250.181156-1-pbonzini@redhat.com>
 <20210930133250.181156-2-pbonzini@redhat.com>
 <875yuh2ung.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <875yuh2ung.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.127, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/10/21 07:14, Markus Armbruster wrote:
> Emacs recognizes .rst, but doesn't recognize .rst.inc.  Sure we want
> file names that defeat common tooling?
> 
> 

I don't do Emacs, but a patch for .editorconfig should rectify that.

Paolo


