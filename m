Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836DF2CDD0E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 19:05:19 +0100 (CET)
Received: from localhost ([::1]:58840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kksyj-0007UD-1H
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 13:05:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kksvR-0006JF-3z
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 13:01:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kksvH-0008Je-Pq
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 13:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607018502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hepiUigvgd5OyuL63v2MCsqJDmywONuoON9ZiVrzeoE=;
 b=Dalc6eu44U8XW3MPYwLmISiSz2r9AO1LwD5WBt0JTR01mB7sY/C8ZTO6ojJOBFaAEbPwfF
 WNyF28dhpH2IgHQRzUOqvQo5Pp+uN3hArpVU15idGTNiHO0P62RSUJz01j6yuMAfBrGktC
 CsN7ybYmUPHm3UmRSXhmIEZcEHbb6WQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-EQAZcJNFNo2fTRpLcjb8fg-1; Thu, 03 Dec 2020 13:01:38 -0500
X-MC-Unique: EQAZcJNFNo2fTRpLcjb8fg-1
Received: by mail-ej1-f70.google.com with SMTP id ny19so285286ejb.10
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 10:01:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hepiUigvgd5OyuL63v2MCsqJDmywONuoON9ZiVrzeoE=;
 b=CyWP9uDxezFKOQjMWRZNIpSF0pHnjXICRgt/r27ZLMHnAD4TBApMkL6kr7zeRdDWgF
 O+6zBITzNONyfihHTog/KJs0pKNw4kd0Srj5pFRzXXU0/m9yqVYosFK4W0lEpIp6tSEh
 1L2NU7W6joKqtW6vgQ6cQ/SIsffGtnlVA78DxSa0/EdId5SyIwe3zaa4AJg0VRufX08J
 Qty2DpZhf2EIn/PNauVY6dojLlLN8fXZJsHzR/vvCiN21LhLm35/So/ry1lpedQzbQu8
 u/iu/Hhl0iAcKsuZPG7LglmdzLKjI2V6YdICh9ThuSu/GEAJRd3C6TFgxXnrTAWcvlhF
 uD+w==
X-Gm-Message-State: AOAM531e32dO5qySAlhli0CH4NG7yRU0L2dpS59FMrsSgmm79GObmaxx
 whl/QsQs6i+Y3uZHVw+UZ+xQ5gtrF/gstvLys+W1vdBCd7a0rGxjJF79qOOZsPvQu8PmnnG+HgX
 ANgmtK2z1hsuY4To=
X-Received: by 2002:a50:d6c6:: with SMTP id l6mr3999568edj.80.1607018496850;
 Thu, 03 Dec 2020 10:01:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyR9Y270BNdQJY+6Uza+aKW4w9mzluAocZ68B6F3J/8sqD96wmulgvQecr0hKTVFBcQnAaYew==
X-Received: by 2002:a50:d6c6:: with SMTP id l6mr3999538edj.80.1607018496659;
 Thu, 03 Dec 2020 10:01:36 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zn5sm1246509ejb.111.2020.12.03.10.01.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 10:01:35 -0800 (PST)
To: Kevin Wolf <kwolf@redhat.com>
References: <17afbbfe-209f-e4b2-e9e1-b50abe1fce3c@redhat.com>
 <20201202125124.GD3836@habkost.net>
 <69dff34f-d87b-3a8d-640f-35f6bf5db75c@redhat.com>
 <20201202135451.GE3836@habkost.net> <20201202151713.GE16765@merkur.fritz.box>
 <20201202160554.GG3836@habkost.net> <20201202173506.GH16765@merkur.fritz.box>
 <54637ad5-0662-24ea-d738-1d53e054a103@redhat.com>
 <20201203151532.GA5409@merkur.fritz.box>
 <27f30494-225c-4407-ee1c-1a996b83c8b1@redhat.com>
 <20201203174316.GC5409@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <aa5e529c-105c-341b-b80d-9b30cc29a0d1@redhat.com>
Date: Thu, 3 Dec 2020 19:01:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201203174316.GC5409@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 berrange@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com, armbru@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/12/20 18:43, Kevin Wolf wrote:
> I think I'd want to do step 2 and 3 combined, because converting
> user-creatable objects to oc->configure means manually writing the
> configure function that will be generated from QAPI in step 3. Writing
> code just to throw it away isn't my favourite pastime.

It would only be a couple lines of extra code, but yeah you don't have 
to do it.  It still is clearer to show the steps one by one as they are 
logically separate and it shows what (modulo inlining) the generated 
code ends up doing.

That said having no setter might simplify the introduction of field 
properties too (no allow_set to worry about); perhaps that's a good 
reason to do the oc->configure conversion earlier rather than later, 
especially if QAPI code generation ends up taking a bit longer.

Another good reason is to make sure the API is stable before moving to 
generated code, especially with respect to inheritance.

Paolo


