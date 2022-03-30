Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EEF4EC9C0
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 18:35:22 +0200 (CEST)
Received: from localhost ([::1]:37424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZbI0-0005hi-QO
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 12:35:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nZbFl-0003mS-7i
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 12:33:01 -0400
Received: from [2a00:1450:4864:20::633] (port=41643
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nZbFj-0001U8-Mn
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 12:33:00 -0400
Received: by mail-ej1-x633.google.com with SMTP id bh17so3148255ejb.8
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 09:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=pmG9azyMV22RktcKgEbxIeezY+n2IZ5UMp4aEOGBSmo=;
 b=zkZHqKC3InWBAZxzPqIsIe7sqeM/FHhm0ZQJnS3I+BwuCCwVCqqx5CFfEEiqaMzpCT
 9omSg10f5VIjulsX7BeX6U9RMjOf4pwh0FgzA6uscIm5Nopy1t7XFTHd8XHAjxmzK+Nj
 ROVvkhwJO4XdGvBVigo9aZgYMmdEtzUIe5CgVBPWamWX4cuqHHiGNwlq96Eg3o0WsCfz
 HNt/go0V+Rsz9/HbnSjCIw6F0fGATyqzidPLNPT1y0wUUofp8J56bOXVXxgnOVlRlQnp
 F/NaRj+u4bvYZVO/MLs5JpwtDw1EqxaxkgZhJCxM4g8sMEe/nMLNabCVnRbrZEms4mvH
 +sBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=pmG9azyMV22RktcKgEbxIeezY+n2IZ5UMp4aEOGBSmo=;
 b=fRNCx7MpmRmZBL+dEfADJooLh1p3ixM+TEIKedUgAcCmjJJ/k5bzNnIBptGmwN2sEu
 998npjwNt0NQd4Np1TXz0vgbtO3vamfk8Ql/05I/ZdWToG15gRjSqApd845h8Wt+t8AT
 +qNzREeHdo/RmMt2DguQvFSwjj/Uvz+scuUlOSh7VfdCrG/cU2gNSWhhIeLHLGaDQsCv
 IHs96RVefizEOSUl61umUG17Zkt7r/1VWa6Kb+Q1gDernxVx9kIO9c0K8I2jliFjrXQb
 SQ0BWjkun2XJ6Utc9uJX/grWX0oJf7+l7ztJKoDY7CC78ip0UZq9Nq2R7N3ogMXFnlNy
 OBvA==
X-Gm-Message-State: AOAM532VE/XP2Nf+NW+kbnGnj0Aw+ZEZcvAGcK9MFeGa0VFRC/huStJB
 HiWELDYQTJAZnrytcm0wkWdcycVtZBzvYA==
X-Google-Smtp-Source: ABdhPJzBD2h9gCUUd/UobFZB0CY2ZmuxLB1opikXYZT7gfynIuWX1xbttUowghfDhlr8wNkNlX9UAg==
X-Received: by 2002:a17:906:2b93:b0:6cf:bb48:5a80 with SMTP id
 m19-20020a1709062b9300b006cfbb485a80mr335989ejg.681.1648657975892; 
 Wed, 30 Mar 2022 09:32:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 22-20020a17090600d600b006dfbc46efabsm8400434eji.126.2022.03.30.09.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 09:32:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 176851FFB7;
 Wed, 30 Mar 2022 17:32:54 +0100 (BST)
References: <20220328140240.40798-1-pbonzini@redhat.com>
 <20220328140240.40798-5-pbonzini@redhat.com>
User-agent: mu4e 1.7.11; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 04/15] tests/docker: remove unnecessary default definitions
Date: Wed, 30 Mar 2022 17:32:49 +0100
In-reply-to: <20220328140240.40798-5-pbonzini@redhat.com>
Message-ID: <87v8vvwgcp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::633
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> The definition of DOCKER_IMAGES and DOCKER_TESTS copes already with an
> empty value of $(IMAGES) and $(TESTS), no need to force them to "%" if
> undefined.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

