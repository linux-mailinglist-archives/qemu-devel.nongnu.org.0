Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723CC6E45E1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 12:58:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poMXv-0003JW-0B; Mon, 17 Apr 2023 06:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1poMXs-0003JC-KG
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 06:57:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1poMXq-0005my-RV
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 06:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681729033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KAMptTdgX40vWr7mI5dgdvpuSMuiLUph1AQTLvqu6do=;
 b=XzW1Idia1qvWfmhgmCdXLIDI9ro8pbGB46veMDl9mMC5HBkf8hS0z7kHtB/e41QwKcZosG
 7/yIiW/GvYWaNXYG+DtEOAKnXw8rVLkFN9zsBbNJWD/FtNQ+7UNb9PNfojLYrmm2WZm0TC
 6MaAmB+VGCMjruzTR7WiEgJhpZoVGTY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-7htzl2QBMcuTvFCDjn2jJg-1; Mon, 17 Apr 2023 06:57:10 -0400
X-MC-Unique: 7htzl2QBMcuTvFCDjn2jJg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 116CD8996E0;
 Mon, 17 Apr 2023 10:57:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCA7BC15BA0;
 Mon, 17 Apr 2023 10:57:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2DA2221E5A0F; Mon, 17 Apr 2023 12:57:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Cc: qemu-devel@nongnu.org,  Gerd Hoffmann <kraxel@redhat.com>,  Pavel
 Dovgalyuk <pavel.dovgaluk@ispras.ru>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 2/6] ui: add the infrastructure to support MT events
References: <20230413152120.53967-1-slp@redhat.com>
 <20230413152120.53967-3-slp@redhat.com>
Date: Mon, 17 Apr 2023 12:57:08 +0200
In-Reply-To: <20230413152120.53967-3-slp@redhat.com> (Sergio Lopez's message
 of "Thu, 13 Apr 2023 17:21:16 +0200")
Message-ID: <87sfcybwu3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Sergio Lopez <slp@redhat.com> writes:

> Add the required infrastructure to support generating multitouch events.
>
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/ui/input.h    |  3 +++
>  qapi/ui.json          | 46 ++++++++++++++++++++++++++++++++++++++++---
>  replay/replay-input.c | 18 +++++++++++++++++
>  ui/input.c            |  6 ++++++
>  ui/trace-events       |  1 +
>  5 files changed, 71 insertions(+), 3 deletions(-)
>
> diff --git a/include/ui/input.h b/include/ui/input.h
> index c86219a1c1..2a3dffd417 100644
> --- a/include/ui/input.h
> +++ b/include/ui/input.h
> @@ -8,9 +8,12 @@
>  #define INPUT_EVENT_MASK_BTN   (1<<INPUT_EVENT_KIND_BTN)
>  #define INPUT_EVENT_MASK_REL   (1<<INPUT_EVENT_KIND_REL)
>  #define INPUT_EVENT_MASK_ABS   (1<<INPUT_EVENT_KIND_ABS)
> +#define INPUT_EVENT_MASK_MTT   (1<<INPUT_EVENT_KIND_MTT)
>=20=20
>  #define INPUT_EVENT_ABS_MIN    0x0000
>  #define INPUT_EVENT_ABS_MAX    0x7FFF
> +#define INPUT_EVENT_SLOTS_MIN  0x0
> +#define INPUT_EVENT_SLOTS_MAX  0xa
>=20=20
>  typedef struct QemuInputHandler QemuInputHandler;
>  typedef struct QemuInputHandlerState QemuInputHandlerState;
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 98322342f7..83369bdae8 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1014,7 +1014,7 @@
>  ##
>  { 'enum'  : 'InputButton',
>    'data'  : [ 'left', 'middle', 'right', 'wheel-up', 'wheel-down', 'side=
',
> -  'extra', 'wheel-left', 'wheel-right' ] }
> +  'extra', 'wheel-left', 'wheel-right', 'touch' ] }
>=20=20
>  ##
>  # @InputAxis:
> @@ -1026,6 +1026,17 @@
>  { 'enum'  : 'InputAxis',
>    'data'  : [ 'x', 'y' ] }
>=20=20
> +##
> +# @InputMultitouchType:

Suggest InputMultiTouchType, because...

> +#
> +# Type of a multitouch event.

... the common spelling is multi-touch.

More of the same below.

> +#
> +# Since: 8.1
> +##
> +{ 'enum'  : 'InputMultitouchType',
> +  'data'  : [ 'begin', 'update', 'end', 'cancel', 'data' ] }
> +
> +
>  ##
>  # @InputKeyEvent:
>  #
> @@ -1069,13 +1080,32 @@
>    'data'  : { 'axis'    : 'InputAxis',
>                'value'   : 'int' } }
>=20=20
> +##
> +# @InputMultitouchEvent:
> +#
> +# Multitouch input event.
> +#
> +# @slot: Which slot has generated the event.

Ignorant question: what's a "slot"?

> +# @tracking-id: ID to correlate this event with previously generated eve=
nts.
> +# @axis: Which axis is referenced by @value.
> +# @value: Contact position.
> +#
> +# Since: 8.1
> +##
> +{ 'struct'  : 'InputMultitouchEvent',
> +  'data'  : { 'type'       : 'InputMultitouchType',
> +              'slot'       : 'int',
> +              'tracking-id': 'int',
> +              'axis'       : 'InputAxis',
> +              'value'      : 'int' } }
> +
>  ##
>  # @InputEventKind:
>  #
>  # Since: 2.0
>  ##
>  { 'enum': 'InputEventKind',
> -  'data': [ 'key', 'btn', 'rel', 'abs' ] }
> +  'data': [ 'key', 'btn', 'rel', 'abs', 'mtt' ] }

While we generally avoid abbreviations in QAPI, local consistency is a
strong argument for this one.  Okay.

>=20=20
>  ##
>  # @InputKeyEventWrapper:
> @@ -1101,6 +1131,14 @@
>  { 'struct': 'InputMoveEventWrapper',
>    'data': { 'data': 'InputMoveEvent' } }
>=20=20
> +##
> +# @InputMultitouchEventWrapper:
> +#
> +# Since: 8.1
> +##
> +{ 'struct': 'InputMultitouchEventWrapper',
> +  'data': { 'data': 'InputMultitouchEvent' } }

The only reason for wrapping is consistency with the other branches.
Okay.

> +
>  ##
>  # @InputEvent:
>  #
> @@ -1112,6 +1150,7 @@
   # @type: the input type, one of:
   #
   #        - 'key': Input event of Keyboard
>  #        - 'btn': Input event of pointer buttons
>  #        - 'rel': Input event of relative pointer motion
>  #        - 'abs': Input event of absolute pointer motion
> +#        - 'mtt': Input event of Multitouch

You're imitating the existing "Input event of" pattern, which is fair.
But the pattern is bad.  The phrasing awkward, and so is the place.  By
documenting the values of InputEventKind only here, and not in
InputEventKind's doc comment, the generated documentation for
InputEventKind looks like this:

    "InputEventKind" (Enum)
    -----------------------

    Values
    ~~~~~~

    "key"
       Not documented

    "btn"
       Not documented

    "rel"
       Not documented

    "abs"
       Not documented

    "mtt"
       Not documented


    Since
    ~~~~~

    2.0

We should document them right in InputEventKind's doc comment, roughly
like this:

   ##
   # @InputEventKind:
   #
   # @key: a keyboard input event
   # @btn: a pointer button input event
   # @rel: a relative pointer motion input event
   # @abs: an absolute pointer motion input event
   # @mtt: a multi-touch input event
   #
   # Since: 2.0
   ##

We can then dumb down the documentation of InputEvent member @type to
just

   # @type: the type of input event

What do you think?

Many more doc comments neglect to document members in this file, and in
others.  I'm not asking you to fix them all.

>  #
>  # Since: 2.0
>  ##
> @@ -1121,7 +1160,8 @@
>    'data'  : { 'key'     : 'InputKeyEventWrapper',
>                'btn'     : 'InputBtnEventWrapper',
>                'rel'     : 'InputMoveEventWrapper',
> -              'abs'     : 'InputMoveEventWrapper' } }
> +              'abs'     : 'InputMoveEventWrapper',
> +              'mtt'     : 'InputMultitouchEventWrapper' } }
>=20=20
>  ##
>  # @input-send-event:

[...]


