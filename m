Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7EF3A7D1F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 13:27:52 +0200 (CEST)
Received: from localhost ([::1]:48438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt7EV-0006x8-J3
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 07:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt7D8-0005Zm-MP
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 07:26:26 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:43620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt7D7-0002ne-5i
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 07:26:26 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso1800331wmj.2
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 04:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=YG5HRdIqAZmPLMDMkR3RsakIYEoOHo6EFab523euymM=;
 b=hjCkZ7K/8fwqDXHTR+6iohq9BRg885B4GLI9MW2uWsKCX18pYoE0p6w03luS2FffUW
 dgd87kfU1R6OpFmTNTo0x/fkiD0QhH1hzrLMXghcdK7zkUbHRiGAXfWxvDEMMNVcohdW
 Ojz9bd4aHYT6TMkRhxVXNjvfpcCS0kUlW4epA9Bs4UE92UeSl6QhNpCj84abbx0dfjt9
 SZiwagv/Q/TqQ7Qt7BRAW1rC47mJ9RDQGl0ghmczJ+7dWwxiU2n1N6b3N0YNa9Gie9MZ
 LZksVszpq82zE+lHAteKagvemqtwMBQYnseJzkaG/ZyTcBf5UWAHmS3gB/nfBG5hoH36
 G0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=YG5HRdIqAZmPLMDMkR3RsakIYEoOHo6EFab523euymM=;
 b=nV+Ub6q5ljQ7+HWkNA8JIdf2p5ZDAUbP7XLG2yZ74/3YhzI9i+H0roNs1d4aKNSACU
 /ZsuFC2LTj20/z0//6x8HnEy6KfNwQ4E8dSIGm9w/tWXRgzGZPyrxQJpBtjMf4BqvcNZ
 8/jnVC+2DwWAprPDLjuwJNvEL2lngPG89y9liOIxYVf3gYB7Mmo9Lub0uuaV9T2pbo2n
 g92CHPYD8/arzma8TnJ5B/wWNj+Bk+6vB26a7tyZ/M76Aagqiv7wU8gRORzZ2AARmKwg
 S313cmsf+WSJ7JYFQgzQIE5QXGocrYOC1IG4F1a6sirTAI8tBbCWOmzMJ5FgVNWi6UK0
 rEPw==
X-Gm-Message-State: AOAM532zNyskl2Hwiv/cUmqQU3+GmofVwH+n4N0O7YqlmrhlaVvwAtqT
 6zroha7VX7L8XPJ8e5iVU7mD7A==
X-Google-Smtp-Source: ABdhPJxWvlhXLc0cXUvFaR7LSo+RXX6gi1QwZUy4BUpv8/bl2/0prf/rA4vGVAD36pbvi2qElpgGKQ==
X-Received: by 2002:a1c:f70b:: with SMTP id v11mr22373563wmh.186.1623756383691; 
 Tue, 15 Jun 2021 04:26:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 73sm19618518wrk.17.2021.06.15.04.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 04:26:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 01AEC1FF7E;
 Tue, 15 Jun 2021 12:26:22 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 7/8] qemu/compiler: Remove QEMU_GENERIC
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
 <20210614233143.1221879-8-richard.henderson@linaro.org>
Date: Tue, 15 Jun 2021 12:26:21 +0100
In-Reply-To: <20210614233143.1221879-8-richard.henderson@linaro.org> (Richard
 Henderson's message of "Mon, 14 Jun 2021 16:31:42 -0700")
Message-ID: <87pmwngyhu.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: pbonzini@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> writes:

> All previous users now use C11 _Generic.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

