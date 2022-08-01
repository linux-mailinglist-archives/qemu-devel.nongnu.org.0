Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7B6586C8B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 16:06:17 +0200 (CEST)
Received: from localhost ([::1]:41758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIW3f-0006Om-UY
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 10:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1oIW0J-0003Nn-IB
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 10:02:43 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:40709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1oIW0E-0008Tr-77
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 10:02:43 -0400
Received: by mail-qt1-x833.google.com with SMTP id bz13so8043118qtb.7
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 07:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
 :from:date:sender:from:to:cc;
 bh=hlV2JNAOmigrkj3YWDxnHLiv1NhjV6wlTSQ/dRdlK/c=;
 b=RtvbCR3XCC74aCnqXMfGJbsDdoPu1Ddzx6OqBwtzsduAYwTTvqbn+Hb15C5oTpKFCO
 S73SwFPOm1rRIkYwgsfpismlQfZB2fYhfEodfX5HXCA4Fzbmir/Pt3JQiQrqozyT1FWw
 AUUyQhxiFBXXEIxTmPBPao27J/vQpNqmAQBAGn4EwZe51cljeN56oMX5fYGPzQvi4jGe
 +KX1NI4rXc4BHXlUEWNHq78+UvdoFzlyLkUqKk8X4gIbNJv0KfysIo+h9uUzY3L1hEzr
 mYO+kAZnHrd20thZldX2FLpbX6K4Bp9s82uRuo+vkDYjUF9sD00VFonWRMsz1t7hgyzu
 IapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
 :from:date:sender:x-gm-message-state:from:to:cc;
 bh=hlV2JNAOmigrkj3YWDxnHLiv1NhjV6wlTSQ/dRdlK/c=;
 b=dYMHHBmjxZDof9okfsC1PPxe1fRSPZDQ88xjoKKK7LgBm9DkZvhhYeVnFBK2y7sHzI
 wMHnNIefdMWc1K8CLRTKT+ASCUankSFh5jAhgxrmByspkxGs+wlBxSFOuG8j8Sf2vAZV
 pLZ+6qXiud/5mnYoNXb36sEuK9ZAI+ErZCTHDQsYZa5brFrVovcD/CfxfY6yeIyvPz/T
 7HubN7UDZRRvSEE948JROo9pzGHWrqtSIp/VUNlAIA5qQWnn1Ei1BEPiMzP496s4wP2p
 QoQnldPSAIKuiIbQod2HhYfOnayEighFvybitLpswrIPBOzpeXRQrkdJxotR8JNBa5sL
 pHBA==
X-Gm-Message-State: AJIora+GGkzyey1GupBNYS40uwZV6SYvlm4T3xvnkwLomLq0zkyv3tVI
 XIlp6g5qYgJzoFvM8FHbVw==
X-Google-Smtp-Source: AGRyM1ue4NCO2MVXR3Yf+qH0TYaOmATeKsFYTeCyGLxeV4+dRacRP/GelMDlyYXl/98mZgTYuI8eIA==
X-Received: by 2002:a05:622a:5d2:b0:31e:e353:4f76 with SMTP id
 d18-20020a05622a05d200b0031ee3534f76mr14421380qtb.99.1659362557094; 
 Mon, 01 Aug 2022 07:02:37 -0700 (PDT)
Received: from serve.minyard.net ([47.184.144.75])
 by smtp.gmail.com with ESMTPSA id
 c4-20020ac853c4000000b0031ef0081d77sm7184600qtq.79.2022.08.01.07.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 07:02:29 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:5014:1ce0:c372:36cb])
 by serve.minyard.net (Postfix) with ESMTPSA id 4A7591800D9;
 Mon,  1 Aug 2022 14:02:18 +0000 (UTC)
Date: Mon, 1 Aug 2022 09:02:17 -0500
From: Corey Minyard <minyard@acm.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PULL] IPMI bug fixes
Message-ID: <20220801140217.GA3834@minyard.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=tcminyard@gmail.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: minyard@acm.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not a huge deal, but probably makes mainainers lives a little easier.

Add a change to make Coverity happy.

----------------------------------------------------------------
Corey Minyard (1):
      ipmi:smbus: Add a check around a memcpy

 hw/ipmi/smbus_ipmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
cminyard@t560:/personal/git/qemu/Z$ git request-pull master origin tags/for-qemu-2022-08-01
The following changes since commit cc42559ab129a15554cc485ea9265e34dde7ab5b:

  Merge tag 'pull-ppc-20220728' of https://gitlab.com/danielhb/qemu into staging (2022-07-28 15:06:42 -0700)

are available in the Git repository at:

  git@github.com:cminyard/qemu.git tags/for-qemu-2022-08-01

for you to fetch changes up to 3fde641e7286f9b968bdb3b4b922c6465f2a9abc:

  ipmi:smbus: Add a check around a memcpy (2022-08-01 06:40:50 -0500)

----------------------------------------------------------------
Add a change to make Coverity happy.

----------------------------------------------------------------
Corey Minyard (1):
      ipmi:smbus: Add a check around a memcpy

 hw/ipmi/smbus_ipmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)


