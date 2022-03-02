Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A5C4CAFA5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 21:24:23 +0100 (CET)
Received: from localhost ([::1]:50890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPVWI-0001kB-8U
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 15:24:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPVVN-00013C-FF
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:23:25 -0500
Received: from [2a00:1450:4864:20::336] (port=33090
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPVVK-0005yC-JE
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:23:25 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 n33-20020a05600c3ba100b003832caf7f3aso1657114wms.0
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3SJ9GTMUKOrnnWgBjl/wgx/iCQhEyH4OKAO1LtzXjMw=;
 b=FG4u+wLANNSrXmcZOGHfFSHovpIE0DsO9M74el3Uf4dfNnbUnLUdTZRDzlVP2oHyKQ
 /M6lVA22n1hRvcRchZVb47mOKwC7f245XB6eCsy4Y1UaU480cFKevyMReNnM7Bypp7TS
 czo4/qO0YfrwpxqYpZeAms3dkt+A4xgWzjhoNvCd1whIISAzBcWNv5v3A8v+I8llPE5D
 XNNzrTGQDNfCFyMZoZAJon4QkIL5tpN9JY9ztqVAvne2vf7l43CmE/Un/PhNzLIr6FF5
 u3fV1vdipgC1+YtoKcF8J4cc4YTBUamIfDCvk1dlMIYqmx91avSBwQGItUqkEVqa9k8X
 H+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3SJ9GTMUKOrnnWgBjl/wgx/iCQhEyH4OKAO1LtzXjMw=;
 b=0tmBqmlU7mvzNc7D287oI2O+haM6FgUtb5TsLQF+LgqowOry3WH1yCSF1MknFLTSei
 GzFSziazXb+mPWQVwz7vXIHl2+5d8Fb+7LkqUCZpBIu5+46+hZxZCW7ZQo8m+zaYOBya
 BQC5BMbHMj4mH0zFfksT7lFbJcyl+lBN/Ac/QD0aryhGL8H2E2ZACtQDFqLtG6VP61tM
 nZY+IXbvbAYv7NNo3eY78O4Lq4WeqPM1x4kjInJVGQCPxw5bP1WLXtiGAuQg6j6c29eA
 yDFEawzQu55wJn0MiQMPzul6mKhAksls2Cr0PnBnJwwrhO33qodAlqwK4gWH8aclzyoy
 YPXA==
X-Gm-Message-State: AOAM5305Dzx/TPjN7PLmtuiyipUJOq85MUdNSI2uGZju6S32SLJQH75T
 PPNPHxh6WZWkx+5tnyrSVxM=
X-Google-Smtp-Source: ABdhPJwr9+OepbGZDRHqP7h4aQNZLt1pThZOhIENTvzB4zVVsGkfhnCZuBgcuomfZ0v304HA3WjOxQ==
X-Received: by 2002:a05:600c:4e13:b0:381:c7ac:3ec1 with SMTP id
 b19-20020a05600c4e1300b00381c7ac3ec1mr1263840wmq.122.1646252600741; 
 Wed, 02 Mar 2022 12:23:20 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 g6-20020a05600c4ec600b0037bf934bca3sm8348937wmq.17.2022.03.02.12.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 12:23:19 -0800 (PST)
Message-ID: <1e7d99b5-201e-63ef-d60c-ae632ce44125@redhat.com>
Date: Wed, 2 Mar 2022 21:23:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] deprecation: x86 default machine types
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
References: <20220301195432.114252-1-dgilbert@redhat.com>
 <Yh+sbYC5n4DsZWWg@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Yh+sbYC5n4DsZWWg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eduardo@habkost.net, libvir-list@redhat.com, thuth@redhat.com,
 qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/22 18:42, Daniel P. Berrangé wrote:
> Overall I'm just not seeing enough benefit to justify the
> disruption we'll cause by making this change to existing
> system emulator binaries.

I agree.

Paolo

