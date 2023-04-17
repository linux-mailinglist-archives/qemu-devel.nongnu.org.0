Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CE76E471E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 14:06:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poNbj-0002kA-Bc; Mon, 17 Apr 2023 08:05:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poNb3-0002jA-MP
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 08:04:39 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poNay-0007g9-Ny
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 08:04:37 -0400
Received: by mail-ej1-x635.google.com with SMTP id c9so24613211ejz.1
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 05:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681733070; x=1684325070;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+D315PiBS/y+y+FzxtjkIREoi/fpBaombpPK2YUGb3Q=;
 b=xqKrCfJ6qnTmFdSfVRIPIxFvXFhDR7a1uUMWIYa64RXCGq/+0UTB12LhIVd+gFwHRu
 IudJlwlM6wyYpysH7wd4mpAy3jbyiD6CSfITRHKPxzazZIbsbaDAM01UpmhauY9dEtHu
 Ik9QNBdgVRGZBvEoXwYDCf1BTIa4C08Mbr7nZIav9MPkuyrRgA+BUUiK0iIiUqurCl7i
 9wtOskV+3svtkuGyZZyXRR4jM/LtqjPW8tPLijt6ZAr59IrjTvMnjnCsfJBg5WDY5QK0
 vd1sF5fV+5PXvwSlMB58xdZaKPIrlvSCIX+RLqBJCp8VmslQST10o23hrNZTw6X4O199
 K97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681733070; x=1684325070;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+D315PiBS/y+y+FzxtjkIREoi/fpBaombpPK2YUGb3Q=;
 b=IFjQhfpffKmrEKWZbflm4RPWGg8vA/f0B50iw1vy+YK1rJQQZQl1tquokt/F8A5vff
 ZNIgFwWIqf2zKAH0jfYnj2f9NpYaQPIT7bJQkPLJrw6vZrwJsTN//nHlg0W/52at9J1v
 xKOxZj+9m7lHO0yMxfC4kOQghm0jFOzgVaaBponJWdZuqpmAadv84mk2GRmW39kURgb4
 GNdQCZssglrbgpFTdoTlZbgdMC/5CV4stMTqkWJ5N0Rj5MF5tIihcGwcLF8iMKdYfSCH
 x8zqBtN80an92ox6f/L6kmRKT03lkbhvXER2BZaG2OornAOgS/9ETxPZUkbyUS5wVyTw
 clhw==
X-Gm-Message-State: AAQBX9ecDJEvK+HgIT+A6qePY8+UAOtLHl/CsNoz4+n2WP3j1GAh7yNk
 NHe6F3JDYOpbu6bITpHPtVHha6tYvD/xYUzQXxb29w==
X-Google-Smtp-Source: AKy350bQbSZhMZvmOMi/kWwMVHiviRxa5X+s52z2XNkj0SzVz3nWFdZQNAfS697JLdfqi50lfrH5K7hjZatDA0Z6Uzg=
X-Received: by 2002:a17:906:fad0:b0:94e:e494:13b8 with SMTP id
 lu16-20020a170906fad000b0094ee49413b8mr3436065ejb.6.1681733070224; Mon, 17
 Apr 2023 05:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230414160433.2096866-1-alex.bennee@linaro.org>
 <20230414160433.2096866-9-alex.bennee@linaro.org>
 <87bkjmddxi.fsf@pond.sub.org> <878req9211.fsf@linaro.org>
In-Reply-To: <878req9211.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Apr 2023 13:04:19 +0100
Message-ID: <CAFEAcA9k424MwkX9Nhwb-x+oTWYJNUCXeRPvfRePtidckidpvQ@mail.gmail.com>
Subject: Re: [PATCH 08/12] qom: allow for properties to become "fixed"
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, virtio-fs@redhat.com, 
 Erik Schilling <erik.schilling@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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

On Mon, 17 Apr 2023 at 12:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> The use-case is this whole series. Basically I want to have a generic
> device (vhost-user-device) which has a bunch of control knobs the user
> can fiddle with (e.g. virtio id, num_vqs and the like). However for the
> specialised versions of this device (e.g. vhost-user-gpio) some of these
> values (e.g. virtio id) need to be fixed.

> Mark suggested maybe just duplicating the properties in a similar way to
> DEFINE_AUDIO_PROPERTIES but that doesn't really address the problem
> wanting to "fix" some of the values for the subclasses and preventing
> the user from changing things.

This shouldn't be something visible to the user of the object,
though, surely? An object which doesn't have a configurable
virtio-id property because the specific subclass has a fixed
value should look exactly like an object which doesn't have
a configurable virtio-id property because that property just
doesn't exist.

If we add a facility for "constant properties" (which is pretty
much what this would be) then we should do it because it's
useful for users of QOM objects (and especially for users of
QOM objects via the QMP interface) to be able to introspect
them and say "ah, this is a property of the object but it's
a constant value".

thanks
-- PMM

