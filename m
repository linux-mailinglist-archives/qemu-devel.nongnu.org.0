Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 626193E1478
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 14:11:08 +0200 (CEST)
Received: from localhost ([::1]:56894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBcDL-0007rY-3D
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 08:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mBcC4-0006Ss-Nw
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:09:48 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mBcC3-00024M-1s
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:09:48 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 n12-20020a05600c3b8cb029025a67bbd40aso6165306wms.0
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 05:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=gtzhoXgFQoZQv46yGzOJIO4zWZC6YJx+umB7xOuQ4yM=;
 b=prMHyf2O6gdJS6UcIL1Qmp2uPGDEr1XvTbvdZKVf96kWyq13o78iQhcykJOV+GyGVt
 PhfRzsc9V0ds+k0xCv0N/kf1C3w8ZBENH8Qyjw3pagwaDhZm43dgvH0r81uA/2JjEjxv
 vXYFUfF5SKHUxk0eAnBg2f9nhYGug/chyxOXWFL6NPgQK2WZIn4ss2giZ3a/5csGrqZL
 NqN9ydzEV7MAwESil3zFoasvw+RTvbe1u9j7BGGxrPgee65nEH2dXQLLgAK03uiBdte2
 Vmb/4gWI4xqP9DoZshghbYYwtLb+LlMw/o8uwv65w4ZRzrm9Og8Fv4blYcB8RjObRNAn
 klvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=gtzhoXgFQoZQv46yGzOJIO4zWZC6YJx+umB7xOuQ4yM=;
 b=mJjX2VwLdOW37l2tzD/JMr208U8aIi/K/s8g5K6pVHD6RCdHX+Elttka86TMByhLG3
 p3fh/2q77jbPWjSsgzlqYR9iRp2BXZd3Pw0DFkCKP0Omex7lf6THqrFQt8KJljEl7YVf
 Yb9NzxeadCz6Hh7CgMSxWkMNx10y0UsCSLsV3rlclodGOGmRJbVJ1VMMYTzCcQU1sp89
 H1/Kga1lguw/9U6IKKuCQSTGTj9JKK0N6L1FhMDswTTT1UYaEWpE8Ds0+zeajtIRIiZ6
 QTAymkPjGJwMl1BL9ykwgsHGCS1pwVAdBv2tv1hgp7PwMPPCOKDBVWx4RozCdX9uwuv3
 20VA==
X-Gm-Message-State: AOAM533B339Csjmz4hn8nRER2BQ7aCWkLctyJBQNTCtv/lWfFuwXf68Z
 nmGSDQgf3yu4tRK4tboZAC6NVQ==
X-Google-Smtp-Source: ABdhPJwycJI1X+UMylTovKCcZgcERJEYH6rrI9ncU9OrRc6+yRz4VPHv01cjge/YiFYxfiMMJPbBdg==
X-Received: by 2002:a1c:4b12:: with SMTP id y18mr14513891wma.67.1628165385664; 
 Thu, 05 Aug 2021 05:09:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i10sm9016328wmq.21.2021.08.05.05.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 05:09:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A50691FF96;
 Thu,  5 Aug 2021 13:09:43 +0100 (BST)
References: <20210804005621.1577302-1-jsnow@redhat.com>
 <20210804005621.1577302-5-jsnow@redhat.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 4/6] docs/devel: create TCG subsection
Date: Thu, 05 Aug 2021 13:09:05 +0100
In-reply-to: <20210804005621.1577302-5-jsnow@redhat.com>
Message-ID: <87czqsks8o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


John Snow <jsnow@redhat.com> writes:

> Signed-off-by: John Snow <jsnow@redhat.com>

modulo Peter's comments re decodetree:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

