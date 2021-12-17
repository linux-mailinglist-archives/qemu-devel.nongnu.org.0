Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782CD478B3B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 13:18:08 +0100 (CET)
Received: from localhost ([::1]:53778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myCBZ-00044C-UB
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 07:18:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1myC9W-00025p-JV
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 07:15:59 -0500
Received: from [2607:f8b0:4864:20::92d] (port=41740
 helo=mail-ua1-x92d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1myC9U-00032R-8f
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 07:15:57 -0500
Received: by mail-ua1-x92d.google.com with SMTP id p37so3918197uae.8
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 04:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=qGEolK7JekvK/dcUa+HI2fE75vAPCQwiYY4cPpkp/l0=;
 b=O5dyIZ8Mq9CHtkBKb76HUl/PQ3cHANQ9r3ypAMp9ruvNViGKKIWh+0v+15o1VZqjrH
 /CmcUMe+fwujHb29n6ooycIRMqxMQe3+7YMGz/uxvk71539MPr37DBAnVFDvdPsLGO4y
 HwVsRTHZ18z8NheOGsCmlzT4t92jRR9TyLrlbXhj3aVSTZryPk0EdTtV9hQvyc8D8NEb
 ogHRqVXvfzxAA9NglLrUrFk7jo9n37of7tJ8ArqWkMOdmUmKVH2zrtZniEagJYFH9nQ2
 tuLHBlFNkx85KxwebaF6hkzHUXHJ4vAZomgkiQPF9Yg4Q5/YORPLJpAVbXg70g3RHwuY
 oAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=qGEolK7JekvK/dcUa+HI2fE75vAPCQwiYY4cPpkp/l0=;
 b=PgpxU4JxFcBmWaJB0+PZKFUOFleEMi8botD3vceedXwhevUSNlyInSMhzZVi4dqGN6
 JTwAmFTCf3NFoPeFtjouRLr2kXIX5Q8PWJn7jnWTAyHqi4lXu9TST78VKjBA81nYASGH
 aL8fr2QqRxzJF3Q9iziMGxI05FTFUeDvp0jSW9RkHobKDv1dO5QLVUwe5tWGNs6Fj/qg
 +Lb6dsSqcyqaCHhzhtV1NZmxd6yHt2Nx5owp03US00ZkxDLeGhfnlltwYs5Zyi8Gw4Gz
 PgITjTNCZUJE0OgDhH9IhsycxQrE4JVlhMlyG0w861/mtSIEPPAGoGWoa1rei7q/X1xe
 XUTA==
X-Gm-Message-State: AOAM531B9cFeMfeTBB7BfwwdczdUXxfc5bPLOuiVSnuQ49eW+IrLPe3H
 IrSA+37MY7MceCAPffIjIKPjFA==
X-Google-Smtp-Source: ABdhPJwxOPOsQt3fhPdrnOCgCc23N0hvMeVQlLbT6J+3JiKdL4hYdCZG7lr7MfJOLehIZmmS0+1SSg==
X-Received: by 2002:a05:6102:237a:: with SMTP id
 o26mr745922vsa.79.1639743350666; 
 Fri, 17 Dec 2021 04:15:50 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o7sm1740886vkl.41.2021.12.17.04.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 04:15:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AEAFC1FF96;
 Fri, 17 Dec 2021 12:15:46 +0000 (GMT)
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-3-philmd@redhat.com> <875yrofxki.fsf@linaro.org>
 <34bd86db-a213-bb3a-9c72-8c48bd138835@redhat.com>
 <87v8zneap1.fsf@linaro.org>
 <c2ac9145-25a3-8b66-2039-64229247c403@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v3 02/28] glib-compat: Introduce g_memdup2() wrapper
Date: Fri, 17 Dec 2021 12:15:05 +0000
In-reply-to: <c2ac9145-25a3-8b66-2039-64229247c403@redhat.com>
Message-ID: <87r1abe8b1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ua1-x92d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, "Daniel P
 . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Laurent Vivier <lvivier@redhat.com> writes:

> Alex,
>
> I've added this patch to my trivial patches branch, do you want I drop
> it?

No - the patch itself is fine. I would like to fix up the consistency
later if we can agree on what it should be.

--=20
Alex Benn=C3=A9e

