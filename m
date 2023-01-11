Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4A866573E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 10:21:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFXHb-00006H-PT; Wed, 11 Jan 2023 04:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFXHG-0008T5-Tq
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 04:20:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFXHE-0003mi-TC
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 04:20:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673428808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EE/cORhe1mS7P5RT3OKIfCnId3nYf+vJQAcJOEwP1xQ=;
 b=Eerpt6Y6UgMz33mRXzcjYGrMa33/j1eLUdYls0GHBE72t67r5eUC0tOBVFZIxzpv+PTNhP
 KuAgWIeYCfe/FnQTZFCAhuk3JllXj9PpOMFeWRARPYPLZGYICviFtx/M7OBNgxf788bkjK
 bN8tpbp7qwjIVPCeJpAVgSkrQw7OvAo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-573-LXRYO1ytPrOAKxccGexwng-1; Wed, 11 Jan 2023 04:20:06 -0500
X-MC-Unique: LXRYO1ytPrOAKxccGexwng-1
Received: by mail-wm1-f71.google.com with SMTP id
 m8-20020a05600c3b0800b003d96bdce12fso7491122wms.9
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 01:20:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EE/cORhe1mS7P5RT3OKIfCnId3nYf+vJQAcJOEwP1xQ=;
 b=bC+q4jYiRnW7xZPT1ZdSSCPA7CRmPfZsNjbksQmDMRBXHEmfmbktoGbETSBA34CxR5
 EZiD6FhiVz1puJ/dsDHErNojqZsYOV78k6x9YJlUM6+5RX1IZmk+pnlxdkzU9q7XeYXs
 mcsx10oYipmq1TItngibqPeKQcVCdf3SrmuLaK+8URIGe/X/kPubQPb47Lb19iC3fQcp
 6ypPLlDqo5iq0p9K40OR2dY21mpciNTqHDHZ0l+ucg4MZ+M87P8TWAvZDoZcGaqqKHER
 466C6v1DFXMcwE6ERRxbmf9d5giEfXOGEuPC3reuHyprr//1sSy8n6eeR1vYE3Fb6lpN
 aayQ==
X-Gm-Message-State: AFqh2kqBlAqITiAMScM9xmUuXnnQlTwh2i73n3K8piVIN7YWC0gh0smQ
 xLi+5iF5o7RnELnc+6QqlAz5QQOOc9Y9m2sNsIYzkAoPvctsAjHZa3FItMgvz9JfKqNUJS/AZYD
 gkAYNSjks5PwlMsc=
X-Received: by 2002:a05:600c:2247:b0:3d3:4b1a:6ff9 with SMTP id
 a7-20020a05600c224700b003d34b1a6ff9mr52275150wmm.26.1673428805556; 
 Wed, 11 Jan 2023 01:20:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvtL5xs7zscnxb59UK6JPkGuTjvFYhrykZELdkMI3eL3jZLLt7QjgdRpyYsZHEQp4TTClTSig==
X-Received: by 2002:a05:600c:2247:b0:3d3:4b1a:6ff9 with SMTP id
 a7-20020a05600c224700b003d34b1a6ff9mr52275136wmm.26.1673428805322; 
 Wed, 11 Jan 2023 01:20:05 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5?
 ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.googlemail.com with ESMTPSA id
 m18-20020a05600c4f5200b003c71358a42dsm29893230wmq.18.2023.01.11.01.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 01:20:04 -0800 (PST)
Message-ID: <eb068a2a-071b-38bf-9707-85d0dc22e062@redhat.com>
Date: Wed, 11 Jan 2023 10:20:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PULL 08/29] gitlab: remove redundant setting of PKG_CONFIG_PATH
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
 <20230110160233.339771-9-pbonzini@redhat.com> <Y72U/8LeENuOKu/i@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y72U/8LeENuOKu/i@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

On 1/10/23 17:40, Daniel P. Berrangé wrote:
>> Signed-off-by: Daniel P. Berrang??<berrange@redhat.com>
>
> This has mangled my name - think your client sending mail
> needs to specify utf8 charset in the mail headers perhaps ?

I have a "Content-type: text/plain" header added from the mimecast 
issues of last year, and git has started putting it *after* its own 
Content-type header with utf-8 charset instead of before.  I'll just 
remove the additional header.

Paolo


