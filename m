Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C332FB5F3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 13:03:48 +0100 (CET)
Received: from localhost ([::1]:60256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1pje-0002Ij-Tz
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 07:03:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1phY-0001Pw-Ik
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 07:01:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1phN-0003m4-02
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 07:01:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611057683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xxdIYR3C5m5ba4LPVFvblfm1Q4Du0wWvetyKBQO4Mwo=;
 b=auNF8n4uVRbx2lJlaPYuNrPwTY/pRqsSTeNouJn08pd951OoS2fXMPscM/KXd7sKjbyPu1
 XB7Ur2XwyOq8poQlcIXcssnXsVPxJGUI2MGD6bvRHuCj6Q1QVYc6nix//hNIEMIHYSHKS0
 tjwpKQqtTfLLIq1m4SvGDsua2JTwrcg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-5MTBjNcIM2-IOdUO7EOhlg-1; Tue, 19 Jan 2021 07:01:18 -0500
X-MC-Unique: 5MTBjNcIM2-IOdUO7EOhlg-1
Received: by mail-wm1-f70.google.com with SMTP id h25so1561586wmb.6
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=xxdIYR3C5m5ba4LPVFvblfm1Q4Du0wWvetyKBQO4Mwo=;
 b=BYXJu2ZvOxeIMDT878oILCu0ixnUKpPLLhWezudgshFpuHzrmFITiHJSNtm3sfyVPX
 q7hBVhIPirzAByxYesn/gFQXMs516WiJ0/yyl0htVSFLqq/BAcE6kdMPQfAbTJydLaPg
 oQ5xQNZk3hmnRX10eZa6Gken0h0JFlRS39miA42oZ5+F9NGSe1v95ZsX80HqhUXXqvdC
 63XLqH98CsGSuH11K0rKt47Y0tAVaOXo1UxEowyuXnrDgoNOnJTGHE0TIzDNdji9+BWt
 lTxu8LPB4N8THdqRcsGJjaCVCRAk40m0nLtT3ODZuY6OQdhYKGyOVXiH64FbPHDLWeA0
 gfiw==
X-Gm-Message-State: AOAM531uXC5j1jLYvEF8BsI0ice4hshIWU8bV6zpEChAN402mDWWqtzT
 ziBSh6qE5umkyPpIwnp0hY5qnXiuAZpX9A0Ybp7RL9CKOZ/uwVIts0eHEP6DYQQodYWAo0ckM6z
 jyIMeikDm/0yQ1ZA=
X-Received: by 2002:a1c:9e4b:: with SMTP id h72mr3841004wme.116.1611057677446; 
 Tue, 19 Jan 2021 04:01:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2jOCbDAHZI9vCBdlw28oRGt2UAfvGHFMYyc2ta7zS540NCD05qEyZfkaQmH6cOUMZWDY58Q==
X-Received: by 2002:a1c:9e4b:: with SMTP id h72mr3840982wme.116.1611057677200; 
 Tue, 19 Jan 2021 04:01:17 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i4sm4275727wml.46.2021.01.19.04.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 04:01:16 -0800 (PST)
X-Mozilla-News-Host: news://lore.kernel.org:119
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: git://git.qemu.org/qemu.git now pulls from gitlab
To: qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Message-ID: <93d438bc-4e41-5d97-9759-bfbf455fcf83@redhat.com>
Date: Tue, 19 Jan 2021 13:01:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The qemu.git repository on git.qemu.org is now a mirror of gitlab. The 
git mirror is updated every 15 minutes.

New changes to qemu.git therefore must go through 
git@gitlab.com:qemu-project/qemu.git.

As a result, the "qemu" and "qemu-stable" groups on the qemu.org server 
do not exist anymore.  The following repositories are now read only (no 
one can push to them):

- qemu-jeos.git (last commit Wed Jan 18 10:22:32 2012 -0600)
- qemu-stable-0.10.git (last commit Mon Aug 31 04:58:19 2009 -0400)
- qemu-stable-0.14.git (last commit Wed May 4 13:50:56 2011 -0500)
- qemu-stable-0.15.git (last commit Thu Nov 22 17:19:35 2012 +0100)
- qemu-stable-1.0.git (last commit Sun Feb 19 16:31:27 2012 -0600)
- qemu-stable-1.1.git (last commit Wed Sep 5 10:38:39 2012 -0500)
- qemu-stable-1.2.git (last commit Tue Dec 11 15:09:44 2012 -0600)
- qemu-stable-1.3.git (last commit Mon Jan 28 10:38:28 2013 -0600)
- qemu-stable-1.4.git (last commit Thu May 23 17:12:44 2013 -0500)

Paolo


