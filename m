Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA09E320BF8
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 18:14:46 +0100 (CET)
Received: from localhost ([::1]:49806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDsJh-0005Ip-JG
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 12:14:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zpmarvel@gmail.com>)
 id 1lDsC6-0007di-Ed; Sun, 21 Feb 2021 12:06:55 -0500
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:44578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zpmarvel@gmail.com>)
 id 1lDsC4-0003aT-7o; Sun, 21 Feb 2021 12:06:54 -0500
Received: by mail-io1-xd2d.google.com with SMTP id f6so10803185iop.11;
 Sun, 21 Feb 2021 09:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding;
 bh=LcMCH5K6bzuAGaJFFYpTMp8uE6CD+DyUujsrFAj4wNc=;
 b=bOosARO+32aBdORgcIeu3vEQuqYPX4BDVRiSELpBmbBNAhHu7EB3YyPkFSN6zENhfo
 KCwvbpyuHAieiOTHhphAkSytR0slQgL1w6JAN1/ohtQbyq0dRD5oxap4MQ5mwD/y7Bqc
 IGsUiVFGG9rtV6T8W9MHv7TG6R8o06vM2UIc26KiYdTEU/ukx9e+BsQVNARtYhNt3eH/
 H2tW6aVDE8wG0Uay4lwb+vN2gz73wLKp7sgy/X06NOc6YnAXCrK/a+4ZVRaeae9oZr8K
 50dyFNO4g+cRkfQoHOF9w0JRgZxnh129RvTh8E0ByhOJQMjUj+MnPWvmBI5zkeSzspMj
 HIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:reply-to:mime-version:content-transfer-encoding;
 bh=LcMCH5K6bzuAGaJFFYpTMp8uE6CD+DyUujsrFAj4wNc=;
 b=Itt08xwhpTu5ULl+Zw1F40kdYH8pqw72zinIUMgGPiw96GX4AVqP1EHNy366o5BCju
 M+/sSw6YZ7I05joLvqXSuM5/MN+fBp7+JclQHhh3HzydmiGIssrqdQxyTpSGVu6gPLio
 DN+vpvH0uKnvQco0404/jY8+LCXdij8HMjaxMQwfCx1hLpGoRzLc1DyXMxaH0Yb3kLfr
 cQSZNQIpFQu/GCHe56B0vx6nfK9IEWFb8fuzBeZxC/7tn3AmRxpA+i1LVmOayMCIDq6T
 Iruhh7a8+jxLbmz95fFft4cL9sqk+hSW9VtAHhWKlGjOt9CvfVB+krN6pbh1wZtykHxd
 qLaw==
X-Gm-Message-State: AOAM532VUaKVo/96jKlJKHHuzH0TLJ3yVcgUQ4mxcoa3JN2OOCOUtW5a
 m7Mf6afekKF7eAlCIr5mKzA=
X-Google-Smtp-Source: ABdhPJxc4oXowhkQ1biCWKEioN+uSDhKJipYmgBG79Nk+IIbdMYf5vLl5XCfPthRQzDFF3HKlHwoeg==
X-Received: by 2002:a6b:e504:: with SMTP id y4mr12541535ioc.153.1613927210740; 
 Sun, 21 Feb 2021 09:06:50 -0800 (PST)
Received: from gastly (c-67-177-215-41.hsd1.co.comcast.net. [67.177.215.41])
 by smtp.gmail.com with ESMTPSA id e9sm11350983iob.43.2021.02.21.09.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 09:06:50 -0800 (PST)
Received: from zack by gastly with local (Exim 4.92)
 (envelope-from <zpmarvel@gmail.com>)
 id 1lDsC1-0003Su-DE; Sun, 21 Feb 2021 10:06:49 -0700
From: Zack Marvel <zpmarvel@gmail.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] ui/gtk: vte: fix sending multiple characeters
Date: Sun, 21 Feb 2021 10:06:12 -0700
Message-Id: <20210221170613.13183-1-zpmarvel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <161392666438.21706.4757518764617915041@c667a6b167f6>
References: <161392666438.21706.4757518764617915041@c667a6b167f6>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=zpmarvel@gmail.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry for the noise. Fixed coding style issue.



