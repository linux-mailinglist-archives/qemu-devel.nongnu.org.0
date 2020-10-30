Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C820C2A0D4B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 19:22:44 +0100 (CET)
Received: from localhost ([::1]:41584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYZ2x-0002Iu-P9
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 14:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kYZ0p-0000yK-N3
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 14:20:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kYZ0n-0006Zj-QK
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 14:20:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604082028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X+4VayIVoxph4AbN1dtRsvqY73HyXr/8l6/tx+T7Z88=;
 b=OmctOkHjFnEZlhYn+ZVNRXPNDnQx+3fbR1LmNFypYTumE661Y/w8M8tRGXVNdvYSkyAzPW
 aThdSgaNXBedzfSgTk05VDOFxXvTWMD2INpigWoeQgIHwKJFBR0zjQqU4u8JOASebOTXi8
 4fNfcKGx3+JPqkwR/xLB9T6Ri6pSLts=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-iae4jbMIMHijF6ionXZG9Q-1; Fri, 30 Oct 2020 14:20:26 -0400
X-MC-Unique: iae4jbMIMHijF6ionXZG9Q-1
Received: by mail-wm1-f72.google.com with SMTP id r23so381597wmh.0
 for <qemu-devel@nongnu.org>; Fri, 30 Oct 2020 11:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X+4VayIVoxph4AbN1dtRsvqY73HyXr/8l6/tx+T7Z88=;
 b=P3oRGqseMX4j0gs8cgkGV8xdFiUVnudvJdbQIcbX6uMEnPsKOHPYmAY4Gd/g94KkYd
 ngQM91izi3Q9W+mml8SX1SPVaznl61HCZoOztmUoGWnTk5ySOD+RQuAUi/PLUdR0xwZ7
 ba4ZZOdp20KqA3bB/ht+Yj7BhtJ/i7uR8u5AjVmiEuFvli7iHv2AeqQGf+CZo6XaYGoh
 iabo88RyRiTtsUbv+2rrH1dg9U23bLOeiqSrdTlbfWIqDdf1FQBFA69h7LJvRzGdDIDZ
 yvXd6p3PtnJNmxUHYd6/BC2q5D2wG7j71G72+GBqrckjw0Ch7tethQNAJFnrjDCfW75k
 c25Q==
X-Gm-Message-State: AOAM533y5b8IzYygzZJBYfeoMuRkZFzz2mJceT4/a7qoDCK8AKi+OR3y
 tAKdiOR3EjPYwzMCm3eaTs428wOLWPddqELWomfRAsVHAyQMPfiU2z61etVyWO8jSpO1NHF9xrh
 GpG/f44vBdUytxng=
X-Received: by 2002:a1c:234e:: with SMTP id j75mr4091238wmj.162.1604082025664; 
 Fri, 30 Oct 2020 11:20:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytLaY6N6urmFAkSPNh7cpsMuI6+8c4G9Wh/FO0/9KZARf335NVS9ZYUZA2D+ZAQ2gEKM5c3A==
X-Received: by 2002:a1c:234e:: with SMTP id j75mr4091215wmj.162.1604082025440; 
 Fri, 30 Oct 2020 11:20:25 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e20sm5588690wme.35.2020.10.30.11.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 11:20:24 -0700 (PDT)
Subject: Re: [PATCH 0/2] docs: Fix building with Sphinx 3.2
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201030174700.7204-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7ef49ead-40e1-1705-afc3-e94cac2bf5c9@redhat.com>
Date: Fri, 30 Oct 2020 19:20:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201030174700.7204-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 01:22:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.253, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/10/20 18:46, Peter Maydell wrote:
> 
> This does mean our kernel-doc gets another patch that makes
> it diverge a little from the kernel's version, but we already
> have one of those (commit 152d1967f650f67b7e). I do want to
> try to upstream these to the kernel, but that will require
> more work I suspect since the kernel makes much more extensive
> use of kernel-doc and probably also has other issues when
> building with newer Sphinxes. For the moment I would like us
> to release QEMU 5.2 with docs that build with all the Sphinxes
> we know about.

FWIW I've sent to Linux our other two local patches, and if you are okay
with it I can also do the sync in the other direction before 5.2 (the
plan was to do it afterwards).

Paolo


