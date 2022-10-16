Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A02D85FFF4E
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 14:56:43 +0200 (CEST)
Received: from localhost ([::1]:58594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok3C6-00060M-9f
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 08:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ok2zM-0001dv-2K
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 08:43:32 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ok2zK-0002pM-B4
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 08:43:31 -0400
Received: by mail-wr1-x430.google.com with SMTP id n12so14368543wrp.10
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 05:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=toBmfj5XfGRpVHj73x5Hm+lxqQgmhIU8y7HZqp1L7Rk=;
 b=fNlXD192AQgTWgpnclctxeWwOgU4d/5hzOsTusTOg7qYmeRvSoLtioRdod8KYJk5kJ
 frwa3E2otmxSdOdOX5IGgAiKgDPTORvTZa9MyAPwXzU0FFu3fj36sqsmXTkrdUUJvhw0
 Kh6KjELcprDkxuoGd3e689rHy5yf8NlAzAZyi1QByqnatuiVXxQ+LnYkiBxqzlyECjZI
 vTF1WvJw2kA1ZAoyWoelM2OF1dl1adWs+FSE3NlMzLVBBN+hkNOUoST2O8bWX7seJ0bw
 yRW/pYDOR6G35uE5splr0f9kBj55reNXIgfjsDGypCwtmAXZfchEJYJwS7p5ZYZa+AFP
 uE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=toBmfj5XfGRpVHj73x5Hm+lxqQgmhIU8y7HZqp1L7Rk=;
 b=MAVXHgajHvISLApFZtVYitBClRD78+PPHxERpwclf+9/OPp/2JWATIANF2HgUboYp5
 PcKfNoaTIRufjWRDqCdOcjaxu1YkrJ4NptixePQMd550ew3ZnC9ll/Nz1xp9qajWAnac
 M8CjARxYBMObdEXJe4AhovSHDbHvNrcLEeVFq7XAX14gynZtGE0uWOMCSNZgOS73hQxg
 /ZJ5pFHFvoFfpOpKKzV0/99fIpG3arQj9l8bb+psZh/rqOaoshTnjZTBWDuqalDr488d
 Pn+lbdgLmATDioIDRBuNtxl5iBcH8+h4zJ33HEEK8wxsgqBH3/ABcO3t/FmyihHVvKvz
 Kp7g==
X-Gm-Message-State: ACrzQf1xg8f6lP9ntSuu1Xp9zw1TYJfr4iQcio/Q+jvalu5JvGqFbgU+
 XhmBNDuoEFbEs492RBD0zKmOxIZYuXAGdQ==
X-Google-Smtp-Source: AMsMyM5miEKjz7NQRvNAhTAwmguBFlZyHnrkB5UIpv1dZdejC08kIIFEgBZB9YQZPFcCexkeAFmiFQ==
X-Received: by 2002:a05:6000:15c5:b0:22e:44c5:4973 with SMTP id
 y5-20020a05600015c500b0022e44c54973mr3853845wry.513.1665924207618; 
 Sun, 16 Oct 2022 05:43:27 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a05600c4e8800b003b4cba4ef71sm14076916wmq.41.2022.10.16.05.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 05:43:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3C48A1FFB7;
 Sun, 16 Oct 2022 13:43:26 +0100 (BST)
References: <20221014223642.147845-1-anjo@rev.ng>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Anton Johansson <anjo@rev.ng>
Cc: qemu-devel@nongnu.org, ale@rev.ng, tsimpson@quicinc.com,
 bcain@quicinc.com, mlambert@quicinc.com
Subject: Re: [PATCH] tests/docker: Add flex/bison to `debian-hexagon-cross`
Date: Sun, 16 Oct 2022 13:43:20 +0100
In-reply-to: <20221014223642.147845-1-anjo@rev.ng>
Message-ID: <878rlgndle.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Anton Johansson <anjo@rev.ng> writes:

> debian-hexagon-cross contains two images, one to build the toolchain
> used for building the Hexagon tests themselves, and one image to build
> QEMU and run the tests.
>
> This commit adds flex/bison to the final image that builds QEMU so that
> it can also build idef-parser.
>
> Note: This container is not built by the CI and needs to be rebuilt and
> updated manually.

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

