Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A4E6E42DD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 10:44:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poKS6-0001bB-LR; Mon, 17 Apr 2023 04:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poKRr-0001au-32
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 04:42:59 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poKRh-00048m-Uv
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 04:42:54 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 n9-20020a05600c4f8900b003f05f617f3cso19412577wmq.2
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 01:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681720961; x=1684312961;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oDogvV/KbDOc2pu5zy/l3hr2DNuh3AepOl08MTTKnHY=;
 b=u3kqZVs+dR+1JG/AH4XjgvjrBFlhwqYlDMd3djN1qHMTkh0YgAghEkHww8hwMVZFOW
 R/p/G50yuHoUT/CqEW5ffg30mMay8iDU3TIQRaxh3lRdtna+nPTxZ6B4wDGMEazzkwlQ
 P/VyGpGlyMP3jtCyfaBPe8rcAcYhn5zx+YBwRDhsJT+CtDk5hG7VLAeRw877rw1m6ZQY
 Mr5r7G3UOy4OrB30hJBY2BPAG32A69gxj0XTRKM/UGp3DKFA/VoiTa6NR/5LjG3a6IvK
 a5RU1d4o0eS7SO6WG9oPpPmt0t+X4SByeqxQkiZ9Ugw6R/amQcsWjkME1T7TRerTAdrV
 t7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681720961; x=1684312961;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oDogvV/KbDOc2pu5zy/l3hr2DNuh3AepOl08MTTKnHY=;
 b=P6jvnKDGcC9D4K8iaV9hn6ZzrwS5OA5RuTveD2jiZcdKLp70oC6wOCCYuTv7ojqMW6
 b0WnEfupRhC8UgmmF5sr8IYja38tKBjX5NvXHFF0IfbF/eow2FyBCRXM9g0P0aLyP8su
 +M6zEgWF9MFRMdD/Pxhf119dk4Nr1N+sUDSuKiqxBa/Wu2f21Tw2TNthUZVNbanr16O1
 8hIz8kXKMxIilDiMGOuSIvPZQdWCcIFhMjaRsqVO4CdfDlo5qTNhvJ9/8XYhuf2Gr1n2
 I4XO1ZS937nJcoMgdvBSECGvb2VueiFRh9MJIuycVFLnGol0XnOvLwWmGUxETWT7UxoR
 K9Wg==
X-Gm-Message-State: AAQBX9ePkXNOHJjRJdzlKkV2CeR37QYslKLZH92TzzVPsHTi8VMyitwt
 7K8twP7fJhemTU9+wTiS7VAAyg==
X-Google-Smtp-Source: AKy350ZC9sDMk0htSvfqlkRNGB3sFIRlVDU3FB6Xyr5um5sG8cnh53jxyjL1vby21xGV7eSrWB1N+Q==
X-Received: by 2002:a7b:cc99:0:b0:3ee:1084:aa79 with SMTP id
 p25-20020a7bcc99000000b003ee1084aa79mr8393646wma.20.1681720960729; 
 Mon, 17 Apr 2023 01:42:40 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c315000b003ef6708bc1esm15030721wmo.43.2023.04.17.01.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 01:42:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D668B1FFB7;
 Mon, 17 Apr 2023 09:42:39 +0100 (BST)
References: <20230414160433.2096866-1-alex.bennee@linaro.org>
 <20230417042631.ncmvabezvzloxksl@vireshk-i7>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: qemu-devel@nongnu.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo
 Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtio-fs@redhat.com, Erik Schilling <erik.schilling@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Eduardo
 Habkost
 <eduardo@habkost.net>, Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake
 <eblake@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Jason
 Wang <jasowang@redhat.com>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 00/12] virtio: add vhost-user-generic and reduce copy
 and paste
Date: Mon, 17 Apr 2023 09:42:04 +0100
In-reply-to: <20230417042631.ncmvabezvzloxksl@vireshk-i7>
Message-ID: <87leiq99xc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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


Viresh Kumar <viresh.kumar@linaro.org> writes:

> On 14-04-23, 17:04, Alex Benn=C3=A9e wrote:
>>  hw/virtio/vhost-user-device-pci.c      |  71 +++++
>>  hw/virtio/vhost-user-device.c          | 359 ++++++++++++++++++++++
>>  hw/virtio/vhost-user-fs.c              |   4 +-
>>  hw/virtio/vhost-user-gpio.c            | 405 +------------------------
>>  hw/virtio/vhost-user-rng.c             | 264 +---------------
>
> I wonder why isn't i2c removed as well ?

I will do - mainly I want to do a similar dummy device addition to the
i2c daemon for testing.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

