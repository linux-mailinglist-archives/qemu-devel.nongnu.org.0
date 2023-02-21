Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A0869DFB2
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 12:59:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pURHQ-00083G-4e; Tue, 21 Feb 2023 06:57:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1pURHO-000833-1Q
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:57:54 -0500
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1pURHK-0003d7-Or
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:57:53 -0500
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id ED5094077B00;
 Tue, 21 Feb 2023 11:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru ED5094077B00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1676980645;
 bh=xnErZjfjFVf3dq802Xwz82699ybZSftQBNJQA5uWLFw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aZ5lTLAXvkLOYHzOUL4YiR088BTbZzUAH2aLtFAxeay799Hs0o/Nfh6AFORZs3mA5
 5bvg0Vpw2ylkXTmSlcegEb6D6g30DL2U9IJCKm6v0ahVwfGLfMmROAsW8HOlW5KZaz
 Sp9MzMr/BYdF9WKjE9YyaPJVSwcaTQH4I5yfniMw=
Message-ID: <0c0a3ea3-66ed-46b0-2888-dcea834b51bd@ispras.ru>
Date: Tue, 21 Feb 2023 14:57:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/4] virtio-input: add a virtio-mulitouch device
Content-Language: en-US
To: Sergio Lopez <slp@redhat.com>, qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
References: <20230218162216.46944-1-slp@redhat.com>
 <20230218162216.46944-3-slp@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <20230218162216.46944-3-slp@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

replay/replay-input.c part:
Reviewed-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>

On 18.02.2023 19:22, Sergio Lopez wrote:
> Add a virtio-multitouch device to the family of devices emulated by
> virtio-input implementing the Multi-touch protocol as descripted here:
> 
> https://www.kernel.org/doc/html/latest/input/multi-touch-protocol.html?highlight=multi+touch
> 
> This patch just add the device itself, without connecting it to any
> backends. The following patches will add helpers in "ui" and will enable
> the GTK3 backend to transpose multi-touch events from the host to the
> guest.
> 
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>   hw/input/virtio-input-hid.c      | 123 ++++++++++++++++++++++++++++++-
>   hw/virtio/virtio-input-pci.c     |  25 ++++++-
>   include/hw/virtio/virtio-input.h |   9 ++-
>   include/ui/input.h               |   3 +
>   qapi/ui.json                     |  45 ++++++++++-
>   replay/replay-input.c            |  18 +++++
>   ui/input.c                       |   6 ++
>   ui/trace-events                  |   1 +
>   8 files changed, 216 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/input/virtio-input-hid.c b/hw/input/virtio-input-hid.c
> index d28dab69ba..34109873ac 100644
> --- a/hw/input/virtio-input-hid.c
> +++ b/hw/input/virtio-input-hid.c
> @@ -16,9 +16,11 @@
>   
>   #include "standard-headers/linux/input.h"
>   
> -#define VIRTIO_ID_NAME_KEYBOARD "QEMU Virtio Keyboard"
> -#define VIRTIO_ID_NAME_MOUSE    "QEMU Virtio Mouse"
> -#define VIRTIO_ID_NAME_TABLET   "QEMU Virtio Tablet"
> +#define VIRTIO_ID_NAME_KEYBOARD     "QEMU Virtio Keyboard"
> +#define VIRTIO_ID_NAME_MOUSE        "QEMU Virtio Mouse"
> +#define VIRTIO_ID_NAME_TABLET       "QEMU Virtio Tablet"
> +#define VIRTIO_ID_NAME_MULTITOUCH   "QEMU Virtio Multitouch"
> +#define VIRTIO_ID_SERIAL_MULTITOUCH "virtio-touchscreen-0"
>   
>   /* ----------------------------------------------------------------- */
>   
> @@ -30,6 +32,7 @@ static const unsigned short keymap_button[INPUT_BUTTON__MAX] = {
>       [INPUT_BUTTON_WHEEL_DOWN]        = BTN_GEAR_DOWN,
>       [INPUT_BUTTON_SIDE]              = BTN_SIDE,
>       [INPUT_BUTTON_EXTRA]             = BTN_EXTRA,
> +    [INPUT_BUTTON_TOUCH]             = BTN_TOUCH,
>   };
>   
>   static const unsigned short axismap_rel[INPUT_AXIS__MAX] = {
> @@ -42,6 +45,11 @@ static const unsigned short axismap_abs[INPUT_AXIS__MAX] = {
>       [INPUT_AXIS_Y]                   = ABS_Y,
>   };
>   
> +static const unsigned short axismap_tch[INPUT_AXIS__MAX] = {
> +    [INPUT_AXIS_X]                   = ABS_MT_POSITION_X,
> +    [INPUT_AXIS_Y]                   = ABS_MT_POSITION_Y,
> +};
> +
>   /* ----------------------------------------------------------------- */
>   
>   static void virtio_input_extend_config(VirtIOInput *vinput,
> @@ -81,6 +89,7 @@ static void virtio_input_handle_event(DeviceState *dev, QemuConsole *src,
>       InputKeyEvent *key;
>       InputMoveEvent *move;
>       InputBtnEvent *btn;
> +    InputMultitouchEvent *mtt;
>   
>       switch (evt->type) {
>       case INPUT_EVENT_KIND_KEY:
> @@ -137,6 +146,24 @@ static void virtio_input_handle_event(DeviceState *dev, QemuConsole *src,
>           event.value = cpu_to_le32(move->value);
>           virtio_input_send(vinput, &event);
>           break;
> +    case INPUT_EVENT_KIND_MTT:
> +        mtt = evt->u.mtt.data;
> +        if (mtt->type == INPUT_MULTITOUCH_TYPE_DATA) {
> +            event.type  = cpu_to_le16(EV_ABS);
> +            event.code  = cpu_to_le16(axismap_tch[mtt->axis]);
> +            event.value = cpu_to_le32(mtt->value);
> +            virtio_input_send(vinput, &event);
> +        } else {
> +            event.type  = cpu_to_le16(EV_ABS);
> +            event.code  = cpu_to_le16(ABS_MT_SLOT);
> +            event.value = cpu_to_le32(mtt->slot);
> +            virtio_input_send(vinput, &event);
> +            event.type  = cpu_to_le16(EV_ABS);
> +            event.code  = cpu_to_le16(ABS_MT_TRACKING_ID);
> +            event.value = cpu_to_le32(mtt->tracking_id);
> +            virtio_input_send(vinput, &event);
> +        }
> +        break;
>       default:
>           /* keep gcc happy */
>           break;
> @@ -515,12 +542,102 @@ static const TypeInfo virtio_tablet_info = {
>   
>   /* ----------------------------------------------------------------- */
>   
> +static QemuInputHandler virtio_multitouch_handler = {
> +    .name  = VIRTIO_ID_NAME_MULTITOUCH,
> +    .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_MTT,
> +    .event = virtio_input_handle_event,
> +    .sync  = virtio_input_handle_sync,
> +};
> +
> +static struct virtio_input_config virtio_multitouch_config[] = {
> +    {
> +        .select    = VIRTIO_INPUT_CFG_ID_NAME,
> +        .size      = sizeof(VIRTIO_ID_NAME_MULTITOUCH),
> +        .u.string  = VIRTIO_ID_NAME_MULTITOUCH,
> +    },{
> +        .select    = VIRTIO_INPUT_CFG_ID_SERIAL,
> +        .size      = sizeof(VIRTIO_ID_SERIAL_MULTITOUCH),
> +        .u.string  = VIRTIO_ID_SERIAL_MULTITOUCH,
> +    },{
> +        .select    = VIRTIO_INPUT_CFG_ID_DEVIDS,
> +        .size      = sizeof(struct virtio_input_devids),
> +        .u.ids     = {
> +            .bustype = const_le16(BUS_VIRTUAL),
> +            .vendor  = const_le16(0x0627), /* same we use for usb hid devices */
> +            .product = const_le16(0x0003),
> +            .version = const_le16(0x0001),
> +        },
> +    },{
> +        .select    = VIRTIO_INPUT_CFG_ABS_INFO,
> +        .subsel    = ABS_MT_SLOT,
> +        .size      = sizeof(virtio_input_absinfo),
> +        .u.abs.min = const_le32(INPUT_EVENT_SLOTS_MIN),
> +        .u.abs.max = const_le32(INPUT_EVENT_SLOTS_MAX),
> +    },{
> +        .select    = VIRTIO_INPUT_CFG_ABS_INFO,
> +        .subsel    = ABS_MT_TRACKING_ID,
> +        .size      = sizeof(virtio_input_absinfo),
> +        .u.abs.min = const_le32(INPUT_EVENT_SLOTS_MIN),
> +        .u.abs.max = const_le32(INPUT_EVENT_SLOTS_MAX),
> +    },{
> +        .select    = VIRTIO_INPUT_CFG_ABS_INFO,
> +        .subsel    = ABS_MT_POSITION_X,
> +        .size      = sizeof(virtio_input_absinfo),
> +        .u.abs.min = const_le32(INPUT_EVENT_ABS_MIN),
> +        .u.abs.max = const_le32(INPUT_EVENT_ABS_MAX),
> +    },{
> +        .select    = VIRTIO_INPUT_CFG_ABS_INFO,
> +        .subsel    = ABS_MT_POSITION_Y,
> +        .size      = sizeof(virtio_input_absinfo),
> +        .u.abs.min = const_le32(INPUT_EVENT_ABS_MIN),
> +        .u.abs.max = const_le32(INPUT_EVENT_ABS_MAX),
> +    },
> +    { /* end of list */ },
> +};
> +
> +static void virtio_multitouch_init(Object *obj)
> +{
> +    VirtIOInputHID *vhid = VIRTIO_INPUT_HID(obj);
> +    VirtIOInput *vinput = VIRTIO_INPUT(obj);
> +    unsigned short abs_props[] = {
> +        INPUT_PROP_DIRECT,
> +    };
> +    unsigned short abs_bits[] = {
> +        ABS_MT_SLOT,
> +        ABS_MT_TRACKING_ID,
> +        ABS_MT_POSITION_X,
> +        ABS_MT_POSITION_Y,
> +    };
> +
> +    vhid->handler = &virtio_multitouch_handler;
> +    virtio_input_init_config(vinput, virtio_multitouch_config);
> +    virtio_input_extend_config(vinput, keymap_button,
> +                               ARRAY_SIZE(keymap_button),
> +                               VIRTIO_INPUT_CFG_EV_BITS, EV_KEY);
> +    virtio_input_extend_config(vinput, abs_props,
> +                               ARRAY_SIZE(abs_props),
> +                               VIRTIO_INPUT_CFG_PROP_BITS, 0);
> +    virtio_input_extend_config(vinput, abs_bits,
> +                               ARRAY_SIZE(abs_bits),
> +                               VIRTIO_INPUT_CFG_EV_BITS, EV_ABS);
> +}
> +
> +static const TypeInfo virtio_multitouch_info = {
> +    .name          = TYPE_VIRTIO_MULTITOUCH,
> +    .parent        = TYPE_VIRTIO_INPUT_HID,
> +    .instance_size = sizeof(VirtIOInputHID),
> +    .instance_init = virtio_multitouch_init,
> +};
> +
> +/* ----------------------------------------------------------------- */
> +
>   static void virtio_register_types(void)
>   {
>       type_register_static(&virtio_input_hid_info);
>       type_register_static(&virtio_keyboard_info);
>       type_register_static(&virtio_mouse_info);
>       type_register_static(&virtio_tablet_info);
> +    type_register_static(&virtio_multitouch_info);
>   }
>   
>   type_init(virtio_register_types)
> diff --git a/hw/virtio/virtio-input-pci.c b/hw/virtio/virtio-input-pci.c
> index a9d0992389..a53edf46c4 100644
> --- a/hw/virtio/virtio-input-pci.c
> +++ b/hw/virtio/virtio-input-pci.c
> @@ -25,10 +25,11 @@ struct VirtIOInputPCI {
>       VirtIOInput vdev;
>   };
>   
> -#define TYPE_VIRTIO_INPUT_HID_PCI "virtio-input-hid-pci"
> -#define TYPE_VIRTIO_KEYBOARD_PCI  "virtio-keyboard-pci"
> -#define TYPE_VIRTIO_MOUSE_PCI     "virtio-mouse-pci"
> -#define TYPE_VIRTIO_TABLET_PCI    "virtio-tablet-pci"
> +#define TYPE_VIRTIO_INPUT_HID_PCI  "virtio-input-hid-pci"
> +#define TYPE_VIRTIO_KEYBOARD_PCI   "virtio-keyboard-pci"
> +#define TYPE_VIRTIO_MOUSE_PCI      "virtio-mouse-pci"
> +#define TYPE_VIRTIO_TABLET_PCI     "virtio-tablet-pci"
> +#define TYPE_VIRTIO_MULTITOUCH_PCI "virtio-multitouch-pci"
>   OBJECT_DECLARE_SIMPLE_TYPE(VirtIOInputHIDPCI, VIRTIO_INPUT_HID_PCI)
>   
>   struct VirtIOInputHIDPCI {
> @@ -102,6 +103,14 @@ static void virtio_tablet_initfn(Object *obj)
>                                   TYPE_VIRTIO_TABLET);
>   }
>   
> +static void virtio_multitouch_initfn(Object *obj)
> +{
> +    VirtIOInputHIDPCI *dev = VIRTIO_INPUT_HID_PCI(obj);
> +
> +    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
> +                                TYPE_VIRTIO_MULTITOUCH);
> +}
> +
>   static const TypeInfo virtio_input_pci_info = {
>       .name          = TYPE_VIRTIO_INPUT_PCI,
>       .parent        = TYPE_VIRTIO_PCI,
> @@ -140,6 +149,13 @@ static const VirtioPCIDeviceTypeInfo virtio_tablet_pci_info = {
>       .instance_init = virtio_tablet_initfn,
>   };
>   
> +static const VirtioPCIDeviceTypeInfo virtio_multitouch_pci_info = {
> +    .generic_name  = TYPE_VIRTIO_MULTITOUCH_PCI,
> +    .parent        = TYPE_VIRTIO_INPUT_HID_PCI,
> +    .instance_size = sizeof(VirtIOInputHIDPCI),
> +    .instance_init = virtio_multitouch_initfn,
> +};
> +
>   static void virtio_pci_input_register(void)
>   {
>       /* Base types: */
> @@ -150,6 +166,7 @@ static void virtio_pci_input_register(void)
>       virtio_pci_types_register(&virtio_keyboard_pci_info);
>       virtio_pci_types_register(&virtio_mouse_pci_info);
>       virtio_pci_types_register(&virtio_tablet_pci_info);
> +    virtio_pci_types_register(&virtio_multitouch_pci_info);
>   }
>   
>   type_init(virtio_pci_input_register)
> diff --git a/include/hw/virtio/virtio-input.h b/include/hw/virtio/virtio-input.h
> index f2da63d309..08f1591424 100644
> --- a/include/hw/virtio/virtio-input.h
> +++ b/include/hw/virtio/virtio-input.h
> @@ -24,10 +24,11 @@ OBJECT_DECLARE_TYPE(VirtIOInput, VirtIOInputClass,
>   #define VIRTIO_INPUT_GET_PARENT_CLASS(obj) \
>           OBJECT_GET_PARENT_CLASS(obj, TYPE_VIRTIO_INPUT)
>   
> -#define TYPE_VIRTIO_INPUT_HID "virtio-input-hid-device"
> -#define TYPE_VIRTIO_KEYBOARD  "virtio-keyboard-device"
> -#define TYPE_VIRTIO_MOUSE     "virtio-mouse-device"
> -#define TYPE_VIRTIO_TABLET    "virtio-tablet-device"
> +#define TYPE_VIRTIO_INPUT_HID  "virtio-input-hid-device"
> +#define TYPE_VIRTIO_KEYBOARD   "virtio-keyboard-device"
> +#define TYPE_VIRTIO_MOUSE      "virtio-mouse-device"
> +#define TYPE_VIRTIO_TABLET     "virtio-tablet-device"
> +#define TYPE_VIRTIO_MULTITOUCH "virtio-multitouch-device"
>   
>   OBJECT_DECLARE_SIMPLE_TYPE(VirtIOInputHID, VIRTIO_INPUT_HID)
>   #define VIRTIO_INPUT_HID_GET_PARENT_CLASS(obj) \
> diff --git a/include/ui/input.h b/include/ui/input.h
> index c86219a1c1..2a3dffd417 100644
> --- a/include/ui/input.h
> +++ b/include/ui/input.h
> @@ -8,9 +8,12 @@
>   #define INPUT_EVENT_MASK_BTN   (1<<INPUT_EVENT_KIND_BTN)
>   #define INPUT_EVENT_MASK_REL   (1<<INPUT_EVENT_KIND_REL)
>   #define INPUT_EVENT_MASK_ABS   (1<<INPUT_EVENT_KIND_ABS)
> +#define INPUT_EVENT_MASK_MTT   (1<<INPUT_EVENT_KIND_MTT)
>   
>   #define INPUT_EVENT_ABS_MIN    0x0000
>   #define INPUT_EVENT_ABS_MAX    0x7FFF
> +#define INPUT_EVENT_SLOTS_MIN  0x0
> +#define INPUT_EVENT_SLOTS_MAX  0xa
>   
>   typedef struct QemuInputHandler QemuInputHandler;
>   typedef struct QemuInputHandlerState QemuInputHandlerState;
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 0abba3e930..ae2496ca9c 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1001,7 +1001,7 @@
>   ##
>   { 'enum'  : 'InputButton',
>     'data'  : [ 'left', 'middle', 'right', 'wheel-up', 'wheel-down', 'side',
> -  'extra', 'wheel-left', 'wheel-right' ] }
> +  'extra', 'wheel-left', 'wheel-right', 'touch' ] }
>   
>   ##
>   # @InputAxis:
> @@ -1013,6 +1013,17 @@
>   { 'enum'  : 'InputAxis',
>     'data'  : [ 'x', 'y' ] }
>   
> +##
> +# @InputMultitouchType:
> +#
> +# Type of a multitouch event.
> +#
> +# Since: 2.0
> +##
> +{ 'enum'  : 'InputMultitouchType',
> +  'data'  : [ 'begin', 'update', 'end', 'cancel', 'data' ] }
> +
> +
>   ##
>   # @InputKeyEvent:
>   #
> @@ -1056,13 +1067,31 @@
>     'data'  : { 'axis'    : 'InputAxis',
>                 'value'   : 'int' } }
>   
> +##
> +# @InputMultitouchEvent:
> +#
> +# Multitouch input event.
> +#
> +# @axis: Which axis is referenced by @value.
> +# @value: Pointer position.  For absolute coordinates the
> +#         valid range is 0 -> 0x7ffff
> +#
> +# Since: 2.0
> +##
> +{ 'struct'  : 'InputMultitouchEvent',
> +  'data'  : { 'type'       : 'InputMultitouchType',
> +              'slot'       : 'int',
> +              'tracking-id': 'int',
> +              'axis'       : 'InputAxis',
> +              'value'      : 'int' } }
> +
>   ##
>   # @InputEventKind:
>   #
>   # Since: 2.0
>   ##
>   { 'enum': 'InputEventKind',
> -  'data': [ 'key', 'btn', 'rel', 'abs' ] }
> +  'data': [ 'key', 'btn', 'rel', 'abs', 'mtt' ] }
>   
>   ##
>   # @InputKeyEventWrapper:
> @@ -1088,6 +1117,14 @@
>   { 'struct': 'InputMoveEventWrapper',
>     'data': { 'data': 'InputMoveEvent' } }
>   
> +##
> +# @InputMultitouchEventWrapper:
> +#
> +# Since: 2.0
> +##
> +{ 'struct': 'InputMultitouchEventWrapper',
> +  'data': { 'data': 'InputMultitouchEvent' } }
> +
>   ##
>   # @InputEvent:
>   #
> @@ -1099,6 +1136,7 @@
>   #        - 'btn': Input event of pointer buttons
>   #        - 'rel': Input event of relative pointer motion
>   #        - 'abs': Input event of absolute pointer motion
> +#        - 'mtt': Input event of Multitouch
>   #
>   # Since: 2.0
>   ##
> @@ -1108,7 +1146,8 @@
>     'data'  : { 'key'     : 'InputKeyEventWrapper',
>                 'btn'     : 'InputBtnEventWrapper',
>                 'rel'     : 'InputMoveEventWrapper',
> -              'abs'     : 'InputMoveEventWrapper' } }
> +              'abs'     : 'InputMoveEventWrapper',
> +              'mtt'     : 'InputMultitouchEventWrapper' } }
>   
>   ##
>   # @input-send-event:
> diff --git a/replay/replay-input.c b/replay/replay-input.c
> index 1147e3d34e..092f6b5ee9 100644
> --- a/replay/replay-input.c
> +++ b/replay/replay-input.c
> @@ -22,6 +22,7 @@ void replay_save_input_event(InputEvent *evt)
>       InputKeyEvent *key;
>       InputBtnEvent *btn;
>       InputMoveEvent *move;
> +    InputMultitouchEvent *mtt;
>       replay_put_dword(evt->type);
>   
>       switch (evt->type) {
> @@ -58,6 +59,14 @@ void replay_save_input_event(InputEvent *evt)
>           replay_put_dword(move->axis);
>           replay_put_qword(move->value);
>           break;
> +    case INPUT_EVENT_KIND_MTT:
> +        mtt = evt->u.mtt.data;
> +        replay_put_dword(mtt->type);
> +        replay_put_qword(mtt->slot);
> +        replay_put_qword(mtt->tracking_id);
> +        replay_put_dword(mtt->axis);
> +        replay_put_qword(mtt->value);
> +        break;
>       case INPUT_EVENT_KIND__MAX:
>           /* keep gcc happy */
>           break;
> @@ -73,6 +82,7 @@ InputEvent *replay_read_input_event(void)
>       InputBtnEvent btn;
>       InputMoveEvent rel;
>       InputMoveEvent abs;
> +    InputMultitouchEvent mtt;
>   
>       evt.type = replay_get_dword();
>       switch (evt.type) {
> @@ -109,6 +119,14 @@ InputEvent *replay_read_input_event(void)
>           evt.u.abs.data->axis = (InputAxis)replay_get_dword();
>           evt.u.abs.data->value = replay_get_qword();
>           break;
> +    case INPUT_EVENT_KIND_MTT:
> +        evt.u.mtt.data = &mtt;
> +        evt.u.mtt.data->type = (InputMultitouchType)replay_get_dword();
> +        evt.u.mtt.data->slot = replay_get_qword();
> +        evt.u.mtt.data->tracking_id = replay_get_qword();
> +        evt.u.mtt.data->axis = (InputAxis)replay_get_dword();
> +        evt.u.mtt.data->value = replay_get_qword();
> +        break;
>       case INPUT_EVENT_KIND__MAX:
>           /* keep gcc happy */
>           break;
> diff --git a/ui/input.c b/ui/input.c
> index f2d1e7a3a7..f788db20f7 100644
> --- a/ui/input.c
> +++ b/ui/input.c
> @@ -212,6 +212,7 @@ static void qemu_input_event_trace(QemuConsole *src, InputEvent *evt)
>       InputKeyEvent *key;
>       InputBtnEvent *btn;
>       InputMoveEvent *move;
> +    InputMultitouchEvent *mtt;
>   
>       if (src) {
>           idx = qemu_console_get_index(src);
> @@ -250,6 +251,11 @@ static void qemu_input_event_trace(QemuConsole *src, InputEvent *evt)
>           name = InputAxis_str(move->axis);
>           trace_input_event_abs(idx, name, move->value);
>           break;
> +    case INPUT_EVENT_KIND_MTT:
> +        mtt = evt->u.mtt.data;
> +        name = InputAxis_str(mtt->axis);
> +        trace_input_event_mtt(idx, name, mtt->value);
> +        break;
>       case INPUT_EVENT_KIND__MAX:
>           /* keep gcc happy */
>           break;
> diff --git a/ui/trace-events b/ui/trace-events
> index 977577fbba..6747361745 100644
> --- a/ui/trace-events
> +++ b/ui/trace-events
> @@ -90,6 +90,7 @@ input_event_key_qcode(int conidx, const char *qcode, bool down) "con %d, key qco
>   input_event_btn(int conidx, const char *btn, bool down) "con %d, button %s, down %d"
>   input_event_rel(int conidx, const char *axis, int value) "con %d, axis %s, value %d"
>   input_event_abs(int conidx, const char *axis, int value) "con %d, axis %s, value 0x%x"
> +input_event_mtt(int conidx, const char *axis, int value) "con %d, axis %s, value 0x%x"
>   input_event_sync(void) ""
>   input_mouse_mode(int absolute) "absolute %d"
>   


