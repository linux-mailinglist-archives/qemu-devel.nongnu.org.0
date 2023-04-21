Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BD86EAB32
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:04:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqQP-0003Rx-J2; Fri, 21 Apr 2023 09:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppqQN-0003Rb-Pj
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:03:39 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppqQL-0007MP-PI
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:03:39 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-504eb1155d3so11972818a12.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 06:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682082216; x=1684674216;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HQRzgxF6utipZUwaRRGO+g3Du3qi1D8J5DJtH5z3tAE=;
 b=Ff4ScZo9fKY39V4fnoOatnzCVIBP1vd64cAj12Kcb2ZIQZPjYOdysmfB+joHfrLW4m
 NZnVrNhC/Je6F9dm3+via6oWtUCQDduF4Ono5/0Hm3xNNqavhGSzSG8NpFVzvMvoS2t3
 nvb5ZZj+H+U/TJGtToadt6+k4l+8pw15CQCc6ryiJncAQWM4LdZZrueErWhZi+fS/kl9
 L/Fw1uPDvr5W60Q5s2tFziqtnUXyfSy5IPi6trDjgHhQyQ23YJxZEblA4Hyj7hfZ9XQD
 OMWV99Qo6sa024esbfJSpvwWXIBUPXHcs0lNuyk1MGKZ/6FQXayQbBJzDdFbCYPH6cs/
 FwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682082216; x=1684674216;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HQRzgxF6utipZUwaRRGO+g3Du3qi1D8J5DJtH5z3tAE=;
 b=hOLf08m4YZBMaRy0LMfs4PbOOihy1NkbtbgsPKQcWV23URlJhmeGpWwpewqr3WcACe
 L9aiMIwox1FP5zRmY0YbMWslK0dR3zozIMftDdbmdI9ul3YLHl4B+sdsIglmb3sHwyhm
 qsAyBfXynSDEsZ8Z6iK1qiFtUKEtnEVVWZOY2C/GLBMgDE40Mn06asNkiKXoEvMretCg
 LgbNymqC1HrQUbdcvL3y/4mGJjjcxBgEri0khtc2oubR1lcSPOspxhSN+2Oi7j/gpiPB
 a/p/AVHMmijn2KTjn6/cQFGbAsLalfB+IaqeWS7CP3x/tXJLOSRHM+PPtI9YXiQU7Yvy
 hhIg==
X-Gm-Message-State: AAQBX9dn4t4KSbIdEPKoipD95eRmMT52qC/uxp4fe2dzdBBa2zWxy8oZ
 LJvNKeQwv5Tnfsr/06kHbMrurcKZsXHvVSVPISYPxg==
X-Google-Smtp-Source: AKy350YiuMkAvRtB43PS/J2NRzr8UHxyq2AfdZb/E6RE2CciOdrNjGhJ0lrLQwERxgnuOIeZAXKkTfZoK990VFYMN60=
X-Received: by 2002:a05:6402:26c4:b0:504:77ed:5a33 with SMTP id
 x4-20020a05640226c400b0050477ed5a33mr9242716edd.8.1682082215759; Fri, 21 Apr
 2023 06:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230421124142.2640825-1-berrange@redhat.com>
In-Reply-To: <20230421124142.2640825-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Apr 2023 14:03:24 +0100
Message-ID: <CAFEAcA8ZkqZt-nvVfD4szgq+DDMQANapX=-kLox+oQfGX9PO2w@mail.gmail.com>
Subject: Re: [PATCH 0/2] fix broken pxb-cxl realization
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Eduardo Lima <elima@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 21 Apr 2023 at 13:42, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> This flaw was discovered in Fedora builds which have
> --enable-qom-cast-debug enabled
>
> Daniel P. Berrang=C3=A9 (2):
>   hw/pci-bridge: fix cast for pxb-cxl dev realization
>   gitlab: run all jobs with QOM debugging enabled

How does this compare with

hw/pci-bridge: pci_expander_bridge: Fix wrong type and rework inheritance

posted yesterday to fix the same issue?

thanks
-- PMM

