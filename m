Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A396F032E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 11:15:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prxil-0003Eg-TW; Thu, 27 Apr 2023 05:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prxif-0003EV-Si
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 05:15:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prxie-0001fm-8F
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 05:15:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682586915;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=v7UuP4nuUeZ3B3+0Kabr5KMbpfNy0I0Wpl8bvEPWf4U=;
 b=NtLHyyyqxn1Km8VX+H04BS2HC1fBWoUW0Ih4HVYOmw7QzrahBko2fhBaICoL2NFdpkUS3E
 495Hpluxe3e7AAD4509Qfbtt6Q6QKxFtOP9YtOok7gdee9D3ZqK1EHVqVUluQ3VjPLanEG
 ac3RZ4XghOGM8o1XrLhCOr+mXjUoK/s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-VuanOiKYNSCZno458TqDSw-1; Thu, 27 Apr 2023 05:15:13 -0400
X-MC-Unique: VuanOiKYNSCZno458TqDSw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-2f69e5def13so3043116f8f.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 02:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682586912; x=1685178912;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v7UuP4nuUeZ3B3+0Kabr5KMbpfNy0I0Wpl8bvEPWf4U=;
 b=jlDYG2hV8tept9FQqh1DL6VpHJdaS29WmciNftarlWKEit2nEKLKEm5L9029LQXMrH
 mUE6Wt9FTysfH8DEwPjdk11A2O/LysgB0QauvD/iwTpjP2MrUyhG7XO7iqf+GwPZe7+A
 GZWmQa8JKwnkCJ3GWzHL08HgfqhhPD8Dqolww+W5f3REr4mW3iYnNdHog5O56ODSVVRb
 tyUGd0UCxpJm9VMm8qs57rFbZCOVAHs3UnChgzBwuFJX2yL32aTVlnIG2e0GrOAxoimD
 PhvHNc7DHeYpCF1bKaGKwsreVOtAxKkPV2omiheXuPuMxsWOAJfFfeEHOLF71505Ny5F
 QgYA==
X-Gm-Message-State: AC+VfDz3SAId3FTBjQX/RHQNuwwwvOnNY/c1/XQ8Hr+K6yGd5wS53mPU
 WLUck06UbOGpHZd6sua0OeGFsBwV0IbxueqCr0GxEgPqOjZl7cJ1WUFp2mtcI6+AghN7Sl4CBQ4
 ePQQJ5mIdF0KPxKk=
X-Received: by 2002:adf:fe02:0:b0:2d2:29a4:4457 with SMTP id
 n2-20020adffe02000000b002d229a44457mr834979wrr.13.1682586912522; 
 Thu, 27 Apr 2023 02:15:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6s4kLUZUrULVianKT/LrUF2fjREferlMnoCnfQpblfBDcE60yz7+CW/iCcYmpVGT3bSnMpig==
X-Received: by 2002:adf:fe02:0:b0:2d2:29a4:4457 with SMTP id
 n2-20020adffe02000000b002d229a44457mr834939wrr.13.1682586912199; 
 Thu, 27 Apr 2023 02:15:12 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 j32-20020a05600c1c2000b003f173987ec2sm24078844wms.22.2023.04.27.02.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 02:15:11 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: afaerber@suse.de
Cc: ale@rev.ng,  anjo@rev.ng,  bazulay@redhat.com,  bbauman@redhat.com,
 chao.p.peng@linux.intel.com,  cjia@nvidia.com,  cw@f00f.org,
 david.edmondson@oracle.com,  Eric Northup <digitaleric@google.com>,
 dustin.kirkland@canonical.com,  eblake@redhat.com,
 edgar.iglesias@gmail.com,  elena.ufimtseva@oracle.com,
 eric.auger@redhat.com,  f4bug@amsat.org,  Felipe Franciosi
 <felipe.franciosi@nutanix.com>,  "iggy@theiggy.com" <iggy@kws1.com>,
 Warner Losh <wlosh@bsdimp.com>,  jan.kiszka@web.de,  jgg@nvidia.com,
 jidong.xiao@gmail.com,  jjherne@linux.vnet.ibm.com,
 joao.m.martins@oracle.com,  konrad.wilk@oracle.com,  kvm@vger.kernel.org,
 mburton@qti.qualcomm.com,  mdean@redhat.com,  mimu@linux.vnet.ibm.com,
 peter.maydell@linaro.org,  qemu-devel@nongnu.org,
 richard.henderson@linaro.org,  shameerali.kolothum.thodi@huawei.com,
 stefanha@gmail.com,  wei.w.wang@intel.com,  z.huo@139.com,
 zwu.kernel@gmail.com, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Subject: Re: cal for agenda for QEMU developers fortnightly conference
 (20230502)
In-Reply-To: <calendar-73bf5f34-029a-4f98-aef4-652c1896beea@google.com> (juan
 quintela's message of "Thu, 27 Apr 2023 09:09:35 +0000")
References: <calendar-73bf5f34-029a-4f98-aef4-652c1896beea@google.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 27 Apr 2023 11:15:10 +0200
Message-ID: <87cz3pd6u9.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Hi

Please, send any topic that you are interested in covering.

At the end of Monday I will send an email with the agenda or the
cancellation of the call, so hurry up.

If I remember correctly, last week philippe was not able to attend, but
there are something to discuss about single binary.

Anything else?

Thanks, Juan.


