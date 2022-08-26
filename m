Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4975A2D4C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:18:57 +0200 (CEST)
Received: from localhost ([::1]:35672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRcyt-0003ay-TM
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRcvg-0001xC-P4
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:15:36 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRcvf-0001Od-5I
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:15:36 -0400
Received: by mail-wr1-x429.google.com with SMTP id z16so2532079wrh.10
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:user-agent:from:to:cc;
 bh=rR7E4irGXFPhUU7MuJH/b1mh/Pz0ihjJY9FUHckRzbk=;
 b=begQJNqTMCgYURk6PYbpe1Q0Jxa4zO0ToF/4ErHp6U1CMb87oITJ66DxsvmIaJh6pX
 4K8xtgsdsI2gsKISwwTh78/IUDVA/2Of9lrgnR4Hje7AD6uocRmiFa59SX/hwaaodY3L
 ZhDMYMawICmMCvhAhB2IWV4kokTyF0fGGAUi7x1gY+0J37uu3PpDQcsSei9HS3Qrt7L+
 oCDP6YbOSAzd76qDvHScQy/eqJSZPIFtl4GEoZWZ8i0ev43bZbWrV73O0FC6LgaHy4in
 izXwpM48pV2xsBNg4vj9zicIjSyFEhJtffRlEMtRAlVyoR0N+6fO6WWzM6NiSSEOcJgc
 D5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:user-agent:x-gm-message-state:from:to:cc;
 bh=rR7E4irGXFPhUU7MuJH/b1mh/Pz0ihjJY9FUHckRzbk=;
 b=Aaj3CkiOEZfKNs5bmQyj+jHFMH/Ix3B8COmNkr+1TpA5/V2JcbutdPjQtubEJLc8YB
 Q9L4BrqejzKiFDrxByMVh8sG9SNPsHExaYfbHC7p1esRnT0EOX4ux81juvcEi5tehzDv
 x7zdgtBzJGEW+2NghLoLF0mfTPYotEP6Es+3zhisHv7vFgxn28TpFVbt1/lYtMQmPTrY
 U5jfmS/MdC8FmwHEzNRNDUXNkFr5vAM2dpxgfuSLHehS+kjJQA0E0prRk9aCa7A4FsOb
 cOHOL2F00oB0t7c2XvdeeSHM7u8jQu0S5Cz/dnINCrCH1TpBc/JIVJbZ9FSXdkXdaEXt
 csvw==
X-Gm-Message-State: ACgBeo14XtWH8j81apZA0YDlX/phsw6bTgnKeRDVEL4pXis9W2CH5FcJ
 UY9FwaY3E+HmUcJMrhPx+vBmFg==
X-Google-Smtp-Source: AA6agR40H5ZRpZVipyIEozGazuc96NG5K5+HfVEKjkMYd7ECZK2kRBmAm4DD0BohMX2VYgmCnP8qMQ==
X-Received: by 2002:a05:6000:2aa:b0:225:63d0:83aa with SMTP id
 l10-20020a05600002aa00b0022563d083aamr350132wry.499.1661534132929; 
 Fri, 26 Aug 2022 10:15:32 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a22-20020a05600c225600b003a3442f1229sm194258wmm.29.2022.08.26.10.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:15:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6218F1FFB7;
 Fri, 26 Aug 2022 18:15:31 +0100 (BST)
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: New feature shout outs for KVM Forum QEMU Status Report
Date: Fri, 26 Aug 2022 18:10:57 +0100
Message-ID: <87wnavexjg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Maintainers,

Are there any features that got added in the last year (since KVM Forum
2021) that you think deserve more recognition? If so please reply to
this thread (or privately to me if you want) and let me know what
feature landed and why it is so cool.

The reward could well be a bullet point in the talk ;-)

Thanks,

--=20
Alex Benn=C3=A9e

