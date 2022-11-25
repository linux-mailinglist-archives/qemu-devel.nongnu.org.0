Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6055D63907F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 21:10:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyf0t-0005pU-NL; Fri, 25 Nov 2022 15:09:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oyf0r-0005o2-Ji
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 15:09:29 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oyf0o-0001rz-St
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 15:09:28 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so4169194wmg.2
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 12:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TGSdyBmOwzp1aAT1I6vw8JH3VsAN1G6Gms7UwvS/I7c=;
 b=rDaOLGk8/EK0342bt1hU4JIzl1/EM6gV/fefwzTWmXlFenUPmMnumzqGyHqmVtK9IC
 W1mSy03qtfjnoJ7/eUdfG5t/geHcnSwCA+bXHYTC+sRgKTYNAQzPlWi91EzEXBfJnMZS
 MHRcIX24xcN+1ft5keij7faSFbEgBaTJxbvZ4ujpRp/87xflfuW0FFyQpKvxBZuARamP
 Jte55c6xnMCrXYg3wCI2hRx+/s6G8WlizNTkQZrGe72aOybw1mQtRexyUYIljCE7CtkG
 fRxz6tAZ3qUTgiratChtYa40QRbRVQy23vYg8rJGXdN3qVnCC2fwJCNxXO1sxM3J06W+
 NSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TGSdyBmOwzp1aAT1I6vw8JH3VsAN1G6Gms7UwvS/I7c=;
 b=jkK9852eB5sHrkj9qdyIRAFd4PeMi9be+ci3drj95FN6VQ0t1z5enjTSkcOGew3ek6
 lze3d71ocWpQtS0u/em33BoH06anqHIJsCpLNieB8lAT7iow44LFia4eqzGtV3uZbxwg
 n44xevaL09SrYss+5ZkXT5RqUif8n5ULiJ+7I8UcdMuAsECh3MjWwUPrt1Q7CHGtf1bl
 SBxbfJ2GAtI88/Sp/0OK+nNBqOZc+y0A0y8wIxNP7XW6vFVhs5LW3EwMSBEaJfFEyfJc
 c4eNXUFd33UMD8S+ZUFOLaPpDbYeBkZ2Gm1zAMmpgkXMocncq6RI4k+AGcY1AZ3aZluq
 7fBg==
X-Gm-Message-State: ANoB5plNpNUsNFaoBceinfZfxxnomSxOSYUUQ4w2LO/pTf/eXudScZjH
 jtyKz6BmcCGh95UR0d9jQoRH3g==
X-Google-Smtp-Source: AA0mqf5bK64rq16qvgBLJlUA2/ay8ay6r16vn5E00HmV81M5j2HgHe5Wq/isakygCwcZHbH07mgVHQ==
X-Received: by 2002:a05:600c:5118:b0:3cf:8e70:f34f with SMTP id
 o24-20020a05600c511800b003cf8e70f34fmr17213065wms.93.1669406965204; 
 Fri, 25 Nov 2022 12:09:25 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c315000b003cfb7c02542sm6790928wmo.11.2022.11.25.12.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 12:09:24 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0D7EA1FFB7;
 Fri, 25 Nov 2022 20:09:24 +0000 (GMT)
References: <20221125173043.1998075-1-alex.bennee@linaro.org>
 <41c0ad43-1663-737c-f7ce-0a27ffb6aaa5@weilnetz.de>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com,
 marcandre.lureau@redhat.com, stefanha@redhat.com,
 mathieu.poirier@linaro.org, viresh.kumar@linaro.org, sgarzare@redhat.com
Subject: Re: [PATCH for 7.2-rc? v2 0/5] continuing efforts to fix vhost-user
 issues
Date: Fri, 25 Nov 2022 20:08:31 +0000
In-reply-to: <41c0ad43-1663-737c-f7ce-0a27ffb6aaa5@weilnetz.de>
Message-ID: <87h6ymaj9n.fsf@linaro.org>
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


Stefan Weil <sw@weilnetz.de> writes:

> Am 25.11.22 um 18:30 schrieb Alex Benn=C3=A9e:
>> Hi,
>> This is continuing to attempt to fix the various vhost-user issues
>> that are currently plaguing the release. One concrete bug I've come
>> across is that all qtest MMIO devices where being treated as legacy
>> which caused the VIRTIO_F_VERSION_1 flag to get missed causing s390x
>> to fall back to trying to set the endian value for the virt-queues.
>
> Do you want to add my 4 commits which fix format strings for
> libvhost-user to your series, or should they be handled separately?

I'm going to leave the choice of VirtIO patches to take to MST given
he is the maintainer and I've obviously broken it enough this release :-/

--=20
Alex Benn=C3=A9e

