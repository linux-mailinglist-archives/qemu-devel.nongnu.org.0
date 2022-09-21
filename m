Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570B45BFF81
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 16:05:44 +0200 (CEST)
Received: from localhost ([::1]:33098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob0M8-0000M8-HF
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 10:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob0F6-0003Cs-85
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:58:25 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob0F4-0003Mv-E1
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:58:24 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n10so9970108wrw.12
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 06:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=ZWgFS1bEFBQtI0JidWfCGSfHSWzcNQydSTHWXNmuJuA=;
 b=YvzjC9o4Bvc+zsT19yXilHBNc82G1px22HvuNNdf9m6aXugRzzOGdYQWG0TZdS8OVa
 VBqeIz4kkZm0GBVUY+zXm7Z8QzJ+8D7F2b8WVW0UBzsWafQ2kwrDxaC1ZVRkG4YUz9iv
 voHxEwjSn23tWGXIzBfRgAm9+7+3cROXgRKPYQaV3rBVqkEkWhvbA/BuViVv+Aei6/lW
 JAODoMMroc/pa1uH8MSq8CMPf+8u2GNlvuDo4qM+yWiGcj2jiIyj6Ij5dMBn2rIGbmG0
 tx+dyBymg62z7wY6RImmH+wy05fSkiC5BDE57AWpDhcL0iWx+SrfOjbDvS3qIDwR7MzX
 oboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=ZWgFS1bEFBQtI0JidWfCGSfHSWzcNQydSTHWXNmuJuA=;
 b=v3BD2vWou41Z/azSkmS2/5LE2lCXAkmXMzlrCZObnRnONQxwPGAxIudx2SjdB0PsHa
 IqdV+vgBsVT3Q1QVPNWxWMfdxgK6Ow1HTJKAa/pTA+wAWgfdDczXAUjmEe0Eg5kv8nHe
 SqYbtVPPoqUmV1Kx1TzX76sTUa7cTL6tsSEvOXEqkljl8CyNjNvO69T7t5MtBy/lpO8i
 p/I4M49QvKJrneSbFRCZp06IITFSnrJA4VMHGNYVCo9jONxC5wHTPTd8DxdxAEsL5F+v
 xiEFD3qKzcZF+pNagYixAYMMBN02SyKzDVn/HsLA6eOFHdvnZHunZsximOW3US5SPA5J
 sMIg==
X-Gm-Message-State: ACrzQf2TqM7QTODGTpmLb4MuTqSkdXY/hXqqXPw3/uGu3LU6wSWvLOo2
 EwGyesBHn5ipPxDbY/z1MbyNmw==
X-Google-Smtp-Source: AMsMyM4fjHaFTsYSIO2ITdYZiPRCABMIobK5TxwPbpgQtldXwxhrz2/PMFx7ocDTJ7d+mmv+LDc8Tw==
X-Received: by 2002:a5d:5887:0:b0:22b:107e:7e39 with SMTP id
 n7-20020a5d5887000000b0022b107e7e39mr5966233wrf.694.1663768700518; 
 Wed, 21 Sep 2022 06:58:20 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1cf608000000b003a5fa79007fsm2883948wmc.7.2022.09.21.06.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 06:58:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B6F821FFB7;
 Wed, 21 Sep 2022 14:58:18 +0100 (BST)
References: <20220901182734.2987337-1-fasano@mit.edu>
 <20220901182734.2987337-2-fasano@mit.edu>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Fasano <fasano@mit.edu>
Cc: qemu-devel@nongnu.org, erdnaxe@crans.org, ma.mandourr@gmail.com
Subject: Re: [RFC 1/4] docs/tcg-plugins: describe QPP API
Date: Wed, 21 Sep 2022 14:57:43 +0100
In-reply-to: <20220901182734.2987337-2-fasano@mit.edu>
Message-ID: <87edw47rt1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Andrew Fasano <fasano@mit.edu> writes:

> Describe how multiple TCG plugins can interact using the QEMU
> Plugin-to-Plugin API (QPP) with both callbacks and direct
> function calls.

Looks ok at first glance. I suspect it is quickly coming to the point we
need to split the examples and the API apart in the docs to stop things
getting too messy.

>
> Signed-off-by: Andrew Fasano <fasano@mit.edu>
> ---
>  docs/devel/tcg-plugins.rst | 76 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
>
> diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
> index a7cc44aa20..7985572027 100644
> --- a/docs/devel/tcg-plugins.rst
> +++ b/docs/devel/tcg-plugins.rst
> @@ -441,3 +441,79 @@ The plugin has a number of arguments, all of them ar=
e optional:
>    associativity of the L2 cache, respectively. Setting any of the L2
>    configuration arguments implies ``l2=3Don``.
>    (default: N =3D 2097152 (2MB), B =3D 64, A =3D 16)
> +
> +Plugin-to-Plugin Interactions
> +-----------------------------
> +
> +Plugins may interact with other plugins through the QEMU Plugin-to-Plugin
> +("QPP") API by including ``qemu/plugin-qpp.h``. This API supports direct
> +function calls between plugins as well as an inter-plugin callback syste=
m.
> +This API allows for composition of plugins: plugins can make use of logi=
c in
> +other plugins without the need for code duplication.
> +
> +Plugin names
> +~~~~~~~~~~~~
> +Plugins are automatically given a name by removing the suffix from their
> +filename.  These plugin names will be used during QPP interactions as
> +described below.  A plugin can access its own name through the preproces=
sor
> +variable ``CURRENT_PLUGIN``.
> +
> +QPP function calls
> +~~~~~~~~~~~~~~~~~~
> +When a plugin (e.g. ``plugin_a``) wishes to make some of its functions (=
e.g.
> +``func_1``) available to other plugins, it must:
> +
> +1. Mark the function definition with the ``QEMU_PLUGIN_EXPORT`` macro. F=
or
> +example : ``QEMU_PLUGIN_EXPORT int func_1(int x) {...}``.
> +2. Provide prototypes for exported functions in a header file (e.g.
> +``plugin_a.h``) using the macro ``QPP_FUN_PROTOTYPE`` with arguments of =
the
> +plugin's name, the function's return type, the function's name, and any
> +arguments the function takes. For example:
> +``QPP_FUN_PROTOTYPE(plugin_a, int, func_1, int);``.
> +3. Import this header from the plugin.
> +
> +When other plugins wish to use the functions exported by ``plugin_a``, t=
hey
> +must:
> +
> +1. Import the header file (e.g. ``plugin_a.h``) with the function protot=
ype(s).
> +2. Call the function when desired by combining the target plugin name, an
> +   underscore, and the target function name, e.g. ``plugin_a_func_1()``.
> +
> +QPP callbacks
> +~~~~~~~~~~~~~
> +
> +The QPP API also allows a plugin to define callback events and for other=
 plugins
> +to request to be notified whenever these events happens. The plugin that=
 defines
> +the callback is responsible for triggering the callback when it so wishe=
s. Other
> +plugins that wish to be notified on these events must define a function =
of an
> +appropriate type and register it to run on this event.
> +
> +When a plugin (e.g. ``plugin_a``) wishes to define a callback (an event =
that
> +other plugins can request to be notified about), it must:
> +
> +1. Define the callback using the ``QPP_CREATE_CB`` macro with a single a=
rgument
> +   of the callback's name. For example: ``QPP_CREATE_CB(on_some_event);`=
`.
> +2. In a header file (e.g. ``plugin_a.h``) create a prototype for the cal=
lback
> +   type with ``QPP_CB_PROTOTYPE`` with arguments of the callback's retur=
n type
> +   (only ``void`` is currently supported), the name of the callback, and=
 any
> +   arguments the callback function will be called with. For example with=
 a
> +   callback named ``on_some_event`` that returns a void and takes an int=
 and
> +   a bool as an argument, you would use: ``QPP_CB_PROTOTYPE(void,
> +   on_some_event, int, bool)``.
> +3. Import this header from the plugin.
> +4. When the plugin wishes to run any registered callback functions, it s=
hould
> +   use the macro ``QPP_RUN_CB`` with the first argument set to the callb=
ack
> +   name followed by the arguments as specified in the header. For exampl=
e:
> +   ``QPP_RUN_CB(on_some_event, 2, true);``.
> +
> +When other plugins wish to register a function to run on such an event, =
they
> +must:
> +
> +1. Import the header file with the callback prototype(s) (e.g. ``plugin_=
a.h``)
> +2. Define a function that matches the callback signature. For example:
> +   ``void plugin_b_callback(int, bool) {...}``.
> +3. Register this function to be run on the callback using the ``QPP_REG_=
CB``
> +   macro with the first argument being the name of the plugin that provi=
des the
> +   callback (as a string), the second being the callback name, and the t=
hird as
> +   the function that should be run. For example: ``QPP_REG_CB("plugin_a",
> +   on_some_event, plugin_b_callback);``


--=20
Alex Benn=C3=A9e

