Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E361C68B102
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 17:44:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOi7F-0004pa-Eq; Sun, 05 Feb 2023 11:43:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pOi7C-0004p6-Uz
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 11:43:42 -0500
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pOi5d-0005Sg-G6
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 11:43:42 -0500
Received: by mail-il1-x134.google.com with SMTP id n2so470095ili.11
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 08:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aY+Z4SwZJ95sjRSr65H6q1wGBTmxfIWBPW5jXDxF0jY=;
 b=Mf5ME1HNQeyvksdwAOniBipGI7wpYLFR0BlPEfPcDi9ede9NnaxXIN05qBgjccqz43
 9YzlrIRDY6jWwtRrvWwWNKXxbIfEVKJWaCL2c+4VrPhpDvKTMvkV5+3byDDrrNXtKFdZ
 z2zyW7+h2h40m5MHlFot9wGnlr8hSIaD5xarM3/tDBFZRIOaJgGjl6yNaWUFNjSt388y
 PhG7jaZOk2O8iLkrH+2oshZjWTACTrSv/jmbdFsbfvbP5AAHcyZwRrylNdKXKkCw+tFs
 Ev0PwndYv1jAYBF4KkkHIeSUDifWaXNFKtLmhhnP4S2dFVL0hEJsvuGavh9CROPPm6eM
 C/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aY+Z4SwZJ95sjRSr65H6q1wGBTmxfIWBPW5jXDxF0jY=;
 b=NC4MzK6YGxHeWhHMBcXrA/FtGffGA5Q358emPa6a+h2dLEhyXV5R11BykPRlyqzB1s
 ttPTSnRG1EDEkD37s1+Yqx8/12QcHkOSz252ZCkqOpYVuz/7ckX3+y4NTVIUAoVktFkF
 fiR3eL0TenXqIuKliwj+wrS8F6iuilZGMlxE/PeZSSKWUuN9rwT2HQDQL1WdLFXqlTvP
 eRzlgbxKFmsUu0EdFE7TkTcli1/uDF7dNTaCXlEqdbapiqgPKiFF6gQhAFjms4LiS5k+
 ffFGk//yspdOf73Yqv0rYWfEqSW1w52usVL+/KIJHqTu37RtKP4bZaRT6VISc7YK8ZUf
 GEeA==
X-Gm-Message-State: AO0yUKVILgQbXCjhniV9FP/W1j8svUskdyRsSMKNmhCUuCPPDER5jrnK
 CZs2R+07Xqscf1zu+WAedFfmYw==
X-Google-Smtp-Source: AK7set+vW2XyBkDZDOU461T15ny0kKW0cpqKIksN2EWes+M17zt7Udy3k4wahaM/rOXzbSkoN8lIpg==
X-Received: by 2002:a05:6e02:214d:b0:310:eccf:14cf with SMTP id
 d13-20020a056e02214d00b00310eccf14cfmr16493981ilv.2.1675615322647; 
 Sun, 05 Feb 2023 08:42:02 -0800 (PST)
Received: from localhost ([143.244.47.84]) by smtp.gmail.com with ESMTPSA id
 h26-20020a02c73a000000b003b778515852sm2720405jao.168.2023.02.05.08.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 08:42:02 -0800 (PST)
Date: Sun, 5 Feb 2023 11:41:37 -0500
From: Emilio Cota <cota@braap.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/2] tcg: use QTree instead of GTree
Message-ID: <Y9/cQX8rXCAt0Own@cota-l14>
References: <20230111035536.309885-1-cota@braap.org>
 <20230111035536.309885-3-cota@braap.org>
 <Y76s1VNBUYwlpIGo@redhat.com> <Y9FRoUI3I5LfQsjW@redhat.com>
 <Y9b1UHyyPux7FKV5@cota-l14> <Y9eNbnL+TgONAMPM@redhat.com>
 <b105124a-4711-29d1-81bd-b3929ff74651@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b105124a-4711-29d1-81bd-b3929ff74651@linaro.org>
Received-SPF: softfail client-ip=2607:f8b0:4864:20::134;
 envelope-from=cota@braap.org; helo=mail-il1-x134.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

On Mon, Jan 30, 2023 at 09:09:47 -1000, Richard Henderson wrote:
> On 1/29/23 23:27, Daniel P. Berrangé wrote:
> > On Sun, Jan 29, 2023 at 05:38:08PM -0500, Emilio Cota wrote:
> > > Since this is a correctness issue, I think we should ship with qtree
> > > and use it when configuring with glib <2.76.0. For later glib versions
> > > we would just use gtree, e.g. via typedef + inline functions.
> > > 
> > > Once the minimum glib required by the configure script is >= 2.76.0,
> > > then we'd remove qtree.
> > > 
> > > If that sounds like a good plan, I can send a v2.
> > 
> > I'm fine with it, but be good to have an opinion here from the TCG
> > subsystem maintainers, CC'ing them
> 
> I agree the correctness issue wants the fix now,
> and typedef + inlines sounds like a good way moving forward.

Thanks, just sent a v2 implementing the above.

		Emilio

