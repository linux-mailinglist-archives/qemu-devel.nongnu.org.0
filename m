Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5691D1DD2B8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 18:05:53 +0200 (CEST)
Received: from localhost ([::1]:41542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbnhf-000145-QM
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 12:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jbnf2-00060i-Ff
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:03:08 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44713
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jbney-0004o4-NC
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:03:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590076982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xGmYH1jC98Zq6xEJaKzyV5qDw2qZzLWN2/8MC35T9l4=;
 b=EpHDgFRtZKQ27LQlPtAqCKWd+R3hHbm107vdGrXhrPWHqdrgGFjWP6IznOLQeGa08HOmMS
 KhDLG0HUkF9k0PdzeVbTHN6IcPZP+N6AETrqAg7b2cNBOC+HsqT56PSe/m/5NutMp5BYQC
 DHX/x7wOeFMvcO6BX+XSDiZT9WIy3Kg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-U76cR2pZMlKiDewi7DSYKw-1; Thu, 21 May 2020 12:02:11 -0400
X-MC-Unique: U76cR2pZMlKiDewi7DSYKw-1
Received: by mail-wr1-f71.google.com with SMTP id r7so3102917wrc.13
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 09:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xGmYH1jC98Zq6xEJaKzyV5qDw2qZzLWN2/8MC35T9l4=;
 b=aSROBRfL1Cgs1o4jS3R4AgOD01zDKar9vikLGaVcmH68Z6RfgZcGlPIiUgNJJuX1lw
 RnVg9vrpGajcf5MGJL30twn20g0m2+WbDiLE0BpCUtvx0b+WvMhGyHzPgzGrWWkOEAoI
 7SXF7YD5gSyAap7xBspaW9/amNfFi67cxhw813GaGe25k+URMpxkV1wGmBrljAdtf60a
 HtE+Chs8xd0Y/MWwBKBNDcmsLLDA3XNsKYen9tDg5JS4vTIvspxDlxICS7O1+WhipLfl
 /TLo6O2AqTj2RmQlhnhqkIDGPCOA9mF5zkacHY++cTJc1a1FlbbxZkIfHIbEhC7LuAIJ
 FrBg==
X-Gm-Message-State: AOAM531xp5DGJuVTl/DcbR7/4obQq0GDAUd7IyJNNseYsO3KJ209bUU7
 uuGIfqVRbNgyFbuFHtEItdfUAqFSxNYAqv3T+r9Rlod28nGwMiDu9jiWpRjudl/tQVqQvYdF6QB
 M3hwDg9O7b4qM/a8=
X-Received: by 2002:a05:600c:2c4e:: with SMTP id
 r14mr10066868wmg.118.1590076930346; 
 Thu, 21 May 2020 09:02:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwN1XT+ltL1eLoDcfylfjzJC+4mSl14Wv+YoPA2+5eB9Hsx0vy1/PEvU2PN9mh/nuPAlSHmyw==
X-Received: by 2002:a05:600c:2c4e:: with SMTP id
 r14mr10066820wmg.118.1590076929743; 
 Thu, 21 May 2020 09:02:09 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.160.154])
 by smtp.gmail.com with ESMTPSA id v131sm7465617wmb.27.2020.05.21.09.02.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 09:02:09 -0700 (PDT)
Subject: Re: [PATCH v4 5/6] i386: Hyper-V VMBus ACPI DSDT entry
To: Igor Mammedov <imammedo@redhat.com>, Roman Kagan <rvkagan@yandex-team.ru>
References: <20200424123444.3481728-1-arilou@gmail.com>
 <20200424123444.3481728-6-arilou@gmail.com>
 <20200505150637.7131e79b@redhat.com> <20200511182121.GA1307176@rvkaganb.lan>
 <20200513173414.62e3cb4e@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fb1661c0-7282-58b4-03b4-a77793cc8e97@redhat.com>
Date: Thu, 21 May 2020 18:02:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200513173414.62e3cb4e@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 01:47:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: mail@maciej.szmigiero.name, eyakovlev@virtuozzo.com,
 Jon Doron <arilou@gmail.com>, qemu-devel@nongnu.org, liran.alon@oracle.com,
 Roman Kagan <rkagan@virtuozzo.com>, vkuznets@redhat.com,
 "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/05/20 17:34, Igor Mammedov wrote:
> I'd rather avoid using random IRQ numbers (considering we are dealing with
> black-box here). So if it's really necessary to have IRQ described here,
> I'd suggest to implement them in device model so they would be reserved
> and QEMU would error out in a sane way if IRQ conflict is detected.

We don't generally detect ISA IRQ conflicts though, do we?

Paolo


