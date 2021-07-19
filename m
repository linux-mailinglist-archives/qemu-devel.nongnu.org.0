Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8783CD695
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 16:28:16 +0200 (CEST)
Received: from localhost ([::1]:42714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5UFj-00053n-Py
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 10:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5UDT-0001UE-Sk
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:25:55 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:45911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5UDS-000773-7W
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:25:55 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso102002wmj.4
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 07:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ArxRg9O/H0Ur0tT6Ee6HWr0R2zhrxnm5DbEFs3RMRKU=;
 b=whvFUyx5joOioJ9JR2jlktoxdOoD+oyewKfaWufehlQIBo0RzUvkaG1byT/r6E0IlU
 MVjqqyVsk5xH7fxVx9a3ff3ROW7hc/eo8XFaa+T1GUndk8A/XGL7JeuKFvzYWy/qqoEK
 oeOIYAEmsvIFxVdp7gCRcaNn4ynrq3ylIGhCU6IHLDSKvo60nYeuspHFI/BTXSvHKNKY
 RKxXCtl67a+u8EWoHSHikPbeqPPgx/iOZygoGKeHsfpM91mKVRMp93qm17OZ5w9ppCtO
 KHhBxMQiQ3om/W1v61qaslyfh0WmXQWxRH1l6nHoyCSUMRUbP/sQUTm68WudsVB9TRWZ
 j6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ArxRg9O/H0Ur0tT6Ee6HWr0R2zhrxnm5DbEFs3RMRKU=;
 b=KC9MQWCVLKEZbaBdMA5yq2LbFAF9pYl/MMspYAOg8dPaj75ct95xXhQI3Nt9GVBdkO
 22vPk2bJbeFduvnQTz1zW3JKqOK5iDTCNyvRYkT4H76JZZLcnsSBiQZk8YRUxX+u7xdS
 PcI4qMb71d5UAk+0qCNwYz5EHOS0LfoHNkxyTsOwUnt/vyIimGqmgYlYFhYSlMlkwkVB
 CPGyQT+7YgDHyMHe1dDcU4AoltQo/6W/OXp9Ahx8mOWRMHT5kNViTjT6UAyJKW0hGYIn
 eT6arPJzZgaUZPaFSSWvaKQ84ogAKd7pRxSpiHjM3T1otaePiOFj7ZEhgpxAxWQjah5L
 kOkg==
X-Gm-Message-State: AOAM533snnBRjXXD/q+MoJu8vKljMZdQXLE+575CsZbabgjbsRCHQm7k
 wwOQVcvGNyQkiZh3IPlRhSNfGA==
X-Google-Smtp-Source: ABdhPJywuYftfvCp1nkpewCljSBPPHYMzqceRaKe19XXv8wX07vlXSCn0eE/0w0KT2BNgbNQhHObUg==
X-Received: by 2002:a05:600c:1c86:: with SMTP id
 k6mr27097273wms.147.1626704752583; 
 Mon, 19 Jul 2021 07:25:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 139sm18522607wma.32.2021.07.19.07.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 07:25:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 44F641FF7E;
 Mon, 19 Jul 2021 15:25:51 +0100 (BST)
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
 <20210717100920.240793-6-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 05/13] plugins/lockstep: make socket path not positional
 & parse bool arg
Date: Mon, 19 Jul 2021 15:25:44 +0100
In-reply-to: <20210717100920.240793-6-ma.mandourr@gmail.com>
Message-ID: <877dhmpehc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: cota@braap.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

