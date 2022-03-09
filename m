Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB814D2E41
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 12:40:55 +0100 (CET)
Received: from localhost ([::1]:38220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRugY-00016Q-Jp
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 06:40:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRub1-0001TE-H3
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:35:12 -0500
Received: from [2a00:1450:4864:20::636] (port=41879
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRub0-0001bd-1V
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:35:11 -0500
Received: by mail-ej1-x636.google.com with SMTP id a8so4266857ejc.8
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 03:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9OuiSaszKLqLncvEXwzxRYBAhDD3OEt31GCAEdS1SGE=;
 b=NzE8PvpTspsQ6HaV5jOcmw9GOqbEFpat5UIs4z27HuOUra+gOWZ0xcxfcC5jd5Q3cP
 Q8AmhPJNIFuqPdhXEqIt3QEK8Dyqf/ntU1lhJXhwfnFA8+R5Jmo4e6CaP4xG53zO4bU/
 /h0Cga6Uqldmf+e0vjvIKF7+/beqtxV20ELgezmPa2V513qqx8sbRVq4w2GTa22hi2pM
 HpAL8YkTeeFZSvbGiVDT4pR440jph8NIajaHwiLL2mEW15ErNwOiK36ZO9gJlaD7PL/a
 G/YsSkVW7uKfXN3J4Rp3nETv3tmrAup9il1BM0WdVQg98iOeaGqxh7Wrza4+jPcC07Bu
 PiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9OuiSaszKLqLncvEXwzxRYBAhDD3OEt31GCAEdS1SGE=;
 b=x/JyKhFm8UrMooj0v3A5Sk578ht5hD17T8EOS91Lv8qBEQT0rpcitfE25AzQyzl9Dr
 ZEPQzukUVTR+NoZUa6O9AJILsrgwii4VBFn0SCwZWA5uHeoQ61OySQkG4qCeDhfObd/b
 OzAVyPG7u4WYjtsQgYKzHPmqhSnwaAA0UgLATL3Hqe/TgUAXJf6GEV+DuID11X+kW6/S
 zY8jaWel61HDPCI+6JnUtpQ/o99dJSDxr2cbgxfnhZdX5of4KzgZw38r/tnd0f7uVn7W
 BODEflJJU1SzgRwyAdTkJThtXbA+WUrZb2mWlBFcNoWdns2jUfj16ZPvG046hSRADK07
 YSzA==
X-Gm-Message-State: AOAM530HUlv+mk37rSmO3X1Ksoj1CLuEZEkGtTg3SoxXKUcno19EyjfL
 1f6yhAcskiKm1yZqKnCt7Z+W6g==
X-Google-Smtp-Source: ABdhPJzn8m8RrSF3zGRHF10AZVtpoe/8ZtUlLOChwZzts5URWqDXxIUVpV0o/ju1HOE7opTG702cTA==
X-Received: by 2002:a17:907:97c5:b0:6da:c285:44f5 with SMTP id
 js5-20020a17090797c500b006dac28544f5mr17455776ejc.208.1646825708550; 
 Wed, 09 Mar 2022 03:35:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n27-20020a1709062bdb00b006da975173bfsm637874ejg.170.2022.03.09.03.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 03:35:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BE8D81FFB7;
 Wed,  9 Mar 2022 11:35:06 +0000 (GMT)
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <20220308145521.3106395-3-kraxel@redhat.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 02/11] edk2: update submodule to stable202202
Date: Wed, 09 Mar 2022 11:35:01 +0000
In-reply-to: <20220308145521.3106395-3-kraxel@redhat.com>
Message-ID: <87v8wn5pg5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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
> ---
>  roms/edk2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/roms/edk2 b/roms/edk2
> index 06dc822d045c..b24306f15daa 160000
> --- a/roms/edk2
> +++ b/roms/edk2
> @@ -1 +1 @@
> -Subproject commit 06dc822d045c2bb42e497487935485302486e151
> +Subproject commit b24306f15daa2ff8510b06702114724b33895d3c

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

