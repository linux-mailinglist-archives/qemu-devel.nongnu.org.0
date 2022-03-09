Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA7F4D2E77
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 12:54:19 +0100 (CET)
Received: from localhost ([::1]:33006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRutW-0000MB-8r
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 06:54:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRurE-000675-1E
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:51:56 -0500
Received: from [2a00:1450:4864:20::42d] (port=44021
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRurC-0004jY-Dt
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:51:55 -0500
Received: by mail-wr1-x42d.google.com with SMTP id e24so2588104wrc.10
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 03:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=21dqnV3loyODIYS9vRM0NIsyUkwxNC7ggKngwRUqTWU=;
 b=QZ/ppmaJpRPMM+3hvz+sVwJxcj0oGsfFCm8ZosK05byvh8PBqUZj1RS+90V5D1rs1d
 /QTpWkWpYMZAwIg+0RMlcNjzzXeZXM5Ytdr78Mb2gHmx3IKwqu2iAsesoKJ6Gl20HCL3
 S8x4uxnBx5CZIQZ5ry/3SwKJ23DVpYvgn92PhYCGJahrWj75lDdiFlUBNfwf5cxRyA8c
 ylAgxTioRmAZyaEF8dQRgYSz/rCdw/rs/0Bk6a8dvpkR40cOEFdUxn2AnrK3jIb4Lu09
 QiD3HTgU8N8lrjE/enIjeBA+laegoniOnXhtakS4+h5ASoNzKicUppoAgR8mQT8h6AoA
 fC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=21dqnV3loyODIYS9vRM0NIsyUkwxNC7ggKngwRUqTWU=;
 b=sKGy9LkqjPzsQbrLJwUjK1JvKChqBRsiWni6+0E3S6SjmpxYXAYT5vmbCedemeyRz/
 1WAsrEFO6xNnRrO9sQrQjVtvHyjRxa4OxweGImZBMr9/sWRPNFHvCTIDALaX0PKOC5eg
 VVRFnrTF0pb+z1+o65sH/IgvJZmPKEps92O+9nMMzalKsMvIzvtH938Ngbl2EDCQ9wuE
 k8AqbYWNJ7TQvkIHR4m2bmlQDJiFZspKbou2Npz5hypFxqqaKe5tmuMNUf3xxU/Hln9/
 WtHWH/SKg/90t0rNUDjttyW0uLV7xGINPVgqVkFM+OCkWMvoF+0J3TtlhwjyAJs11pfR
 cuAA==
X-Gm-Message-State: AOAM533AKNsgnL2cHZCnJHEZ1J7IVbwP2vQ6JExjmXzhMLJN74esnIif
 RzrvxA/ILWuszuJbcCKd9408TQ==
X-Google-Smtp-Source: ABdhPJzJ5x+31b16dNmikbmxzZJz+aGrRdw/pkQo+SSwJu2tpvOqcKUk1SUtBEHzNRmdoXVEASkoWw==
X-Received: by 2002:adf:d1c4:0:b0:203:6d79:f15 with SMTP id
 b4-20020adfd1c4000000b002036d790f15mr5230851wrd.489.1646826712828; 
 Wed, 09 Mar 2022 03:51:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a1c741a000000b00389ab9a53c8sm1599316wmc.36.2022.03.09.03.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 03:51:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E0A2C1FFB7;
 Wed,  9 Mar 2022 11:51:50 +0000 (GMT)
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <20220308145521.3106395-4-kraxel@redhat.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 03/11] edk2: switch to release builds
Date: Wed, 09 Mar 2022 11:51:47 +0000
In-reply-to: <20220308145521.3106395-4-kraxel@redhat.com>
Message-ID: <87r17b5oo9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Gerd Hoffmann <kraxel@redhat.com> writes:

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

