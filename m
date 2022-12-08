Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FAA64727B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 16:08:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3IUy-0002hB-Ex; Thu, 08 Dec 2022 10:07:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p3IUw-0002gV-7k
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:07:42 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p3IUu-00084h-H4
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:07:42 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id c140so1952619ybf.11
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 07:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Lzj/yiNDFh4JW84RkK4BcDNLtWpH3d5QATkJFn3L+HM=;
 b=XNfTLhK7VyqX4KgDYLou1lSWOmFLYGQwWlliu8TAV9qaGuZW4J4ENNN93BJsqwugnp
 8V2smIT/VM+XOQrqOTiv0WExWOIbemyHounhnA79Z02fJa8tudKNWYoUdQlJkKkWL5AQ
 mXrgnpidPcr/J0jsU4QoW+Yqz0erVriie0OZIP7SaKx/W/wCsxXzMrmGvB/u3aiH+c9O
 bhydhELm3rfBReOfy3EVW+2TpOfZEZYE8/Ja0zEnkoqcJ5bUomGnt/uyWR9bS6x/ssM8
 E5WVpfzXT2h1G07F9eUi2axEwgYrtfYYStx4uKUP8cIdLJTaew7gqSz11D75E1WWU9zC
 Ke9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lzj/yiNDFh4JW84RkK4BcDNLtWpH3d5QATkJFn3L+HM=;
 b=x129f7z7NzumHn3PiLLR+T/lhXky2WSryxgSFR7gvs1rYHkCSkVUXI3/wdNi269Onm
 tz/qJaEFIcnQN1E0hAgb5S/YCE06U6lHOum1PssSdfvwSAtsf99C+ZewswLrEjTM4St3
 +VNbTBI8fAbDiSzgiC+LH73gBGjfFegaaILWWpVdS4pyJeM/II2e6O3rzr3LNZ1ik3yz
 elnfLWhYuVFkoAkXon6cU+fhoqPP0xUeZdhkaO3YGTYR1wYy4YNZSV9DYino/r8gRdEK
 OlgPX6RccPRxa7I2M4nmneMCj7rxsXN0ROE96q6F9El3p7MiN98Xb35yaw7A4D01n4pv
 siCA==
X-Gm-Message-State: ANoB5pkiZOA5ZqKMOBHWYKqUyGekfRYaAYqiqWv7F+xuvC/3Xymwpn2O
 V+K4gxqpd64XdCSxQOCHRqNCtGDXnb5U2mfWX7M=
X-Google-Smtp-Source: AA0mqf6pzgvj+/1Fv+e3GprfPnv340pQLcaLD509TsA2151q8KDr3blve6kfR4x3XXSHdaZLSle9LtLXWPbHDcjd4Kc=
X-Received: by 2002:a25:4c85:0:b0:701:6660:4386 with SMTP id
 z127-20020a254c85000000b0070166604386mr14030120yba.366.1670512046920; Thu, 08
 Dec 2022 07:07:26 -0800 (PST)
MIME-Version: 1.0
References: <20221208142306.2642640-1-armbru@redhat.com>
 <20221208142306.2642640-5-armbru@redhat.com>
In-Reply-To: <20221208142306.2642640-5-armbru@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 8 Dec 2022 10:07:14 -0500
Message-ID: <CAJSP0QVgXA8GGbnws1tmk5f-Eox8P47gQ0YuSQzJ25FSywUvCg@mail.gmail.com>
Subject: Re: [PATCH 4/4] coroutine: Break inclusion loop
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, kwolf@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

