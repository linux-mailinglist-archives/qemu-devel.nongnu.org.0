Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDC568196A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 19:37:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMZ1X-0004qM-Qb; Mon, 30 Jan 2023 13:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMZ1K-0004q5-62
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:36:47 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMZ1I-0002bs-G4
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:36:45 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso8874223wms.3
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 10:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9LB7zjg22yHZgb14XrLYMJwUJktthcnezXiFape21+8=;
 b=EpsZuaBeJXXGTHhTpARkpJX3AZW+PZoWb7n7OxQaw+OUdZNfGZlFHia8P1pPdfeAeP
 VHFQu7K6XhdYDm9R313O6d/nN4JhHA3vWKg2hTbJJs3v/GiG1pvAWBbWDU059ZEGVexJ
 h51ywslC5zQETvS+7Sxf6sskASqZ9/VqCV43B5CGCpxHfogrZ0F6DT+O1yP3bkeBmPxI
 OS3R0+H2FdtdTzEuXyL7sV2xJQoCKZ+Y/lvsUsOL+bqSmaG8c3sIcO8oHzQ/+ZhosdL8
 3HU75sbFXLDcuGXI0LX4fV2UiLhvns4mjIQmx34noR1DRYXexsUB4IpG4BfVpiLD/zUj
 CceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9LB7zjg22yHZgb14XrLYMJwUJktthcnezXiFape21+8=;
 b=tqVdqjFfWBdmrc4/vev+5v4M8Lt4pq5duwFbDJpGJRudvr1UHEG+Y1v24ZtFbwQcrP
 MPAUg98K0ndyza4kvklrcBnjGlYWjQp+NpGrf5aIOy5GRNwKJuY2LZU61xczTt4W8gDv
 ggUJVElVcPQNW35MSgUx05tBkcOCALQDGH4UrKiAsVj0TxkneyVQfEoIAoI6vvf8HEJb
 mRjjh7zTsytcC+wjYZMICUYAg27DUkk3IHl/rOfiwF8Y06EtmlNOxiZm0KQT6LaRa8mJ
 XxKIWA6QMJNr43sZrjsYip5c1bgQEsGq6/D/Te3G7uc+0rc6dBOsoZKp2Fpd82HvnWnh
 Ze2A==
X-Gm-Message-State: AFqh2kpnxsISonC3FE+N5Z7j8KkXFqJ0PC39oNRmJQtrNkLwi26DxSD0
 IryMYRMgIIzkirzjF0xK8kVyoA==
X-Google-Smtp-Source: AMrXdXtpsXVJwqQDQ/Z0hxui04bNZR+EDW2VgkSLehw1dKZ/7Pcd9Vz+k45ImuyPoZzEWr0T/8wtFQ==
X-Received: by 2002:a05:600c:310e:b0:3db:fc3:6de4 with SMTP id
 g14-20020a05600c310e00b003db0fc36de4mr47825465wmo.35.1675103802241; 
 Mon, 30 Jan 2023 10:36:42 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a05600c0a4100b003d9fba3c7a4sm18529270wmq.16.2023.01.30.10.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:36:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 548AD1FFB7;
 Mon, 30 Jan 2023 18:36:41 +0000 (GMT)
References: <20220926142422.22325-1-antonio.caggiano@collabora.com>
 <20220926142422.22325-6-antonio.caggiano@collabora.com>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Antonio Caggiano <acaggian@qti.qualcomm.com>
Cc: gert.wollny@collabora.com, dmitry.osipenko@collabora.com, Gerd Hoffmann
 <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 5/9] virtio-gpu: Unrealize
Date: Mon, 30 Jan 2023 18:36:05 +0000
In-reply-to: <20220926142422.22325-6-antonio.caggiano@collabora.com>
Message-ID: <87lelj6f9i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Antonio Caggiano <antonio.caggiano@collabora.com> writes:

> Implement an unrealize function for virtio gpu device.
>
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

