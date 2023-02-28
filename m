Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3D46A578C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 12:12:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWxuW-0002dJ-3P; Tue, 28 Feb 2023 06:12:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWxuP-0002ca-CU
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:12:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWxuL-0000aw-DT
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:12:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677582752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wpQuPL8c90Bf1pFHe7Ri8yXfJ5L7MD+vOWGStm2xqk0=;
 b=F6t7KpQnECisySRDgBCX/Z1BCyqu3ed6TZAJapLDgZiRYRj8SGK6auTes4H/xusNaZG1lN
 9/d37ZLQWOrNWvXfHJ/G5JBGQnNuZm7YLuRZKbqpug/+p1nujw+N+ENU7fCE6UkQUtF5FF
 gS7ABRpeOHW65VfWO7JBsamjgm+3hy4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-4ggVoP4QMbmS4ReAp0hBMQ-1; Tue, 28 Feb 2023 06:12:30 -0500
X-MC-Unique: 4ggVoP4QMbmS4ReAp0hBMQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m31-20020a05600c3b1f00b003e9de8c95easo3497800wms.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 03:12:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wpQuPL8c90Bf1pFHe7Ri8yXfJ5L7MD+vOWGStm2xqk0=;
 b=3LKrvJq/JGJqVlfN+3Tauq+N86PeoP718bGBXYg+HUx4mZNR5uku+VXW6VEDrEm1WA
 bUokyJ8SZHLOYDFlvHLlRus2oHzSCYEOz8o1izTchIm6NCme/wtLp3ADRKNhZRDEwLhf
 rT/AHqPzlJizH9Z+MJ6XKOTLNg3QlEgyQmDm+gLM8fKEO1LVNsdROAM6yoXHKSDLwhGr
 DMmgAsG4VTA20Y+SwR2VjiAHoKSs5pw/K7Hws8spa+jlP1g/o3pjQjMOXuvfQgrWhyO1
 Q6hygr6maKg7xoR8nLfj/vCPBGHDiMeMHEOhKw+jSOH2t0bipUJXUTU3n7x7Da9r3bW0
 Hkyw==
X-Gm-Message-State: AO0yUKWuwamwDmQdRQnOxvxfszC43loRfV8OytG/ZidMX1LPOcSB9gAV
 HD1VqDqCdIKGmJR5+9UKau1+x4ly+lKAX9xayS87PAnXfsgENtvlCam6JZCZ2xUi5rJuWrT5shi
 2FmnG9KnLjI4ZTFY=
X-Received: by 2002:a5d:6b0e:0:b0:2c7:a39:6e30 with SMTP id
 v14-20020a5d6b0e000000b002c70a396e30mr2049944wrw.38.1677582749883; 
 Tue, 28 Feb 2023 03:12:29 -0800 (PST)
X-Google-Smtp-Source: AK7set9oI/QD/RgvVvZBifmeDs/yaRHSeI1eCXGJYICkxBr0U4eDOUrIAvE9ljzr41EoyMJbhF+aig==
X-Received: by 2002:a5d:6b0e:0:b0:2c7:a39:6e30 with SMTP id
 v14-20020a5d6b0e000000b002c70a396e30mr2049919wrw.38.1677582749642; 
 Tue, 28 Feb 2023 03:12:29 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-75.web.vodafone.de.
 [109.43.177.75]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c4f9100b003e876122dc1sm16604362wmq.47.2023.02.28.03.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 03:12:29 -0800 (PST)
Message-ID: <072a7502-6061-12b2-f778-736c6a8f5912@redhat.com>
Date: Tue, 28 Feb 2023 12:12:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org> <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
 <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
 <Y/3MIUDRBUSNg6C5@redhat.com> <20230228050908-mutt-send-email-mst@kernel.org>
 <87cz5uhy50.fsf@pond.sub.org> <20230228055016-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
In-Reply-To: <20230228055016-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 28/02/2023 11.51, Michael S. Tsirkin wrote:
> On Tue, Feb 28, 2023 at 11:39:39AM +0100, Markus Armbruster wrote:
>> The question to answer: Is 32 bit x86 worth its upkeep?  Two
>> sub-questions: 1. Is it worth the human attention?  2. Is it worth
>> (scarce!) CI minutes?
> 
> 3. Is it worth arguing about?

You are aware of the problems we're currently struggeling with, aren't you? 
Darn, we're having *SEVERE* problems with the CI, the QEMU project ran out 
of CI minutes for the second time this year, and you ask whether it's worth 
arguing about??? You're not serious with this question, are you?

  Thomas


