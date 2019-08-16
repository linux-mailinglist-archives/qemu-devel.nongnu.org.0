Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A808A90565
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 18:04:59 +0200 (CEST)
Received: from localhost ([::1]:58176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyeio-0005nQ-An
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 12:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36383)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1hyefq-000363-Lk
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 12:01:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hyefo-0002o2-9C
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 12:01:54 -0400
Received: from 2.mo69.mail-out.ovh.net ([178.33.251.80]:36082)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hyefo-0002m9-2n
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 12:01:52 -0400
Received: from player726.ha.ovh.net (unknown [10.109.146.131])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 401F566C78
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 18:01:50 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 4F0B48D21C6F;
 Fri, 16 Aug 2019 16:01:43 +0000 (UTC)
To: Rashmica Gupta <rashmica.g@gmail.com>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org
References: <20190816073229.22787-1-rashmica.g@gmail.com>
 <20190816073229.22787-4-rashmica.g@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <acb45c02-f43e-9813-37da-bab8b12520ba@kaod.org>
Date: Fri, 16 Aug 2019 18:01:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816073229.22787-4-rashmica.g@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 15235114589709503477
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudeffedgledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.251.80
Subject: Re: [Qemu-devel] [PATCH v5 3/3] hw/gpio: Add in AST2600 specific
 implementation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: andrew@aj.id.au, aik@ozlabs.ru, qemu-devel@nongnu.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/08/2019 09:32, Rashmica Gupta wrote:
> The AST2600 has the same sets of 3.6v gpios as the AST2400 plus an
> addtional two sets of 1.8V gpios.
>=20
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>

One minor comment below, but this is minor.

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  hw/gpio/aspeed_gpio.c | 142 ++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 137 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index d6a4c0c757..a3306a8f32 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -167,6 +167,48 @@
>  #define GPIO_3_6V_MEM_SIZE         0x1F0
>  #define GPIO_3_6V_REG_ARRAY_SIZE   (GPIO_3_6V_MEM_SIZE >> 2)
> =20
> +/* AST2600 only - 1.8V gpios */
> +/*
> + * The AST2600 has same 3.6V gpios as the AST2400 (memory offsets 0x0-=
0x198)
> + * and addtional 1.8V gpios (memory offsets 0x800-0x9D4).
> + */
> +#define GPIO_1_8V_REG_OFFSET          0x800
> +#define GPIO_1_8V_ABCD_DATA_VALUE     ((0x800 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_ABCD_DIRECTION      ((0x804 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_ABCD_INT_ENABLE     ((0x808 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_ABCD_INT_SENS_0     ((0x80C - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_ABCD_INT_SENS_1     ((0x810 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_ABCD_INT_SENS_2     ((0x814 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_ABCD_INT_STATUS     ((0x818 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_ABCD_RESET_TOLERANT ((0x81C - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_E_DATA_VALUE        ((0x820 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_E_DIRECTION         ((0x824 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_E_INT_ENABLE        ((0x828 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_E_INT_SENS_0        ((0x82C - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_E_INT_SENS_1        ((0x830 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_E_INT_SENS_2        ((0x834 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_E_INT_STATUS        ((0x838 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_E_RESET_TOLERANT    ((0x83C - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_ABCD_DEBOUNCE_1     ((0x840 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_ABCD_DEBOUNCE_2     ((0x844 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_E_DEBOUNCE_1        ((0x848 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_E_DEBOUNCE_2        ((0x84C - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_DEBOUNCE_TIME_1     ((0x850 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_DEBOUNCE_TIME_2     ((0x854 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_DEBOUNCE_TIME_3     ((0x858 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_ABCD_COMMAND_SRC_0  ((0x860 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_ABCD_COMMAND_SRC_1  ((0x864 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_E_COMMAND_SRC_0     ((0x868 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_E_COMMAND_SRC_1     ((0x86C - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_ABCD_DATA_READ      ((0x8C0 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_E_DATA_READ         ((0x8C4 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_ABCD_INPUT_MASK     ((0x9D0 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_E_INPUT_MASK        ((0x9D4 - GPIO_1_8V_REG_OFFSET) =
>> 2)
> +#define GPIO_1_8V_MEM_SIZE            0x9D8
> +#define GPIO_1_8V_REG_ARRAY_SIZE      ((GPIO_1_8V_MEM_SIZE - \
> +                                      GPIO_1_8V_REG_OFFSET) >> 2)
> +#define GPIO_MAX_MEM_SIZE           MAX(GPIO_3_6V_MEM_SIZE, GPIO_1_8V_=
MEM_SIZE)
> +
>  static int aspeed_evaluate_irq(GPIOSets *regs, int gpio_prev_high, int=
 gpio)
>  {
>      uint32_t falling_edge =3D 0, rising_edge =3D 0;
> @@ -461,6 +503,39 @@ static const AspeedGPIOReg aspeed_3_6v_gpios[GPIO_=
3_6V_REG_ARRAY_SIZE] =3D {
>      [GPIO_AC_INPUT_MASK] =3D         { 7, gpio_reg_input_mask },
>  };
> =20
> +static const AspeedGPIOReg aspeed_1_8v_gpios[GPIO_1_8V_REG_ARRAY_SIZE]=
 =3D {
> +    /* 1.8V Set ABCD */
> +    [GPIO_1_8V_ABCD_DATA_VALUE] =3D     {0, gpio_reg_data_value},
> +    [GPIO_1_8V_ABCD_DIRECTION] =3D      {0, gpio_reg_direction},
> +    [GPIO_1_8V_ABCD_INT_ENABLE] =3D     {0, gpio_reg_int_enable},
> +    [GPIO_1_8V_ABCD_INT_SENS_0] =3D     {0, gpio_reg_int_sens_0},
> +    [GPIO_1_8V_ABCD_INT_SENS_1] =3D     {0, gpio_reg_int_sens_1},
> +    [GPIO_1_8V_ABCD_INT_SENS_2] =3D     {0, gpio_reg_int_sens_2},
> +    [GPIO_1_8V_ABCD_INT_STATUS] =3D     {0, gpio_reg_int_status},
> +    [GPIO_1_8V_ABCD_RESET_TOLERANT] =3D {0, gpio_reg_reset_tolerant},
> +    [GPIO_1_8V_ABCD_DEBOUNCE_1] =3D     {0, gpio_reg_debounce_1},
> +    [GPIO_1_8V_ABCD_DEBOUNCE_2] =3D     {0, gpio_reg_debounce_2},
> +    [GPIO_1_8V_ABCD_COMMAND_SRC_0] =3D  {0, gpio_reg_cmd_source_0},
> +    [GPIO_1_8V_ABCD_COMMAND_SRC_1] =3D  {0, gpio_reg_cmd_source_1},
> +    [GPIO_1_8V_ABCD_DATA_READ] =3D      {0, gpio_reg_data_read},
> +    [GPIO_1_8V_ABCD_INPUT_MASK] =3D     {0, gpio_reg_input_mask},
> +    /* 1.8V Set E */
> +    [GPIO_1_8V_E_DATA_VALUE] =3D     {1, gpio_reg_data_value},
> +    [GPIO_1_8V_E_DIRECTION] =3D      {1, gpio_reg_direction},
> +    [GPIO_1_8V_E_INT_ENABLE] =3D     {1, gpio_reg_int_enable},
> +    [GPIO_1_8V_E_INT_SENS_0] =3D     {1, gpio_reg_int_sens_0},
> +    [GPIO_1_8V_E_INT_SENS_1] =3D     {1, gpio_reg_int_sens_1},
> +    [GPIO_1_8V_E_INT_SENS_2] =3D     {1, gpio_reg_int_sens_2},
> +    [GPIO_1_8V_E_INT_STATUS] =3D     {1, gpio_reg_int_status},
> +    [GPIO_1_8V_E_RESET_TOLERANT] =3D {1, gpio_reg_reset_tolerant},
> +    [GPIO_1_8V_E_DEBOUNCE_1] =3D     {1, gpio_reg_debounce_1},
> +    [GPIO_1_8V_E_DEBOUNCE_2] =3D     {1, gpio_reg_debounce_2},
> +    [GPIO_1_8V_E_COMMAND_SRC_0] =3D  {1, gpio_reg_cmd_source_0},
> +    [GPIO_1_8V_E_COMMAND_SRC_1] =3D  {1, gpio_reg_cmd_source_1},
> +    [GPIO_1_8V_E_DATA_READ] =3D      {1, gpio_reg_data_read},
> +    [GPIO_1_8V_E_INPUT_MASK] =3D     {1, gpio_reg_input_mask},
> +};
> +
>  static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t=
 size)
>  {
>      AspeedGPIOState *s =3D ASPEED_GPIO(opaque);
> @@ -659,8 +734,11 @@ static void aspeed_gpio_get_pin(Object *obj, Visit=
or *v, const char *name,
>      int set_idx, group_idx =3D 0;
> =20
>      if (sscanf(name, "gpio%2[A-Z]%1d", group, &pin) !=3D 2) {
> -        error_setg(errp, "%s: error reading %s", __func__, name);
> -        return;
> +        /* 1.8V gpio */
> +        if (sscanf(name, "gpio%3s%1d", group, &pin) !=3D 2) {
> +            error_setg(errp, "%s: error reading %s", __func__, name);
> +            return;
> +        }

We could extend the GPIO class with this pattern instead.

>      }
>      set_idx =3D get_set_idx(s, group, &group_idx);
>      if (set_idx =3D=3D -1) {
> @@ -683,8 +761,11 @@ static void aspeed_gpio_set_pin(Object *obj, Visit=
or *v, const char *name,
> =20
>      visit_type_bool(v, name, &level, &local_err);
>      if (sscanf(name, "gpio%2[A-Z]%1d", group, &pin) !=3D 2) {
> -        error_setg(errp, "%s: error reading %s", __func__, name);
> -        return;
> +        /* 1.8V gpio */
> +        if (sscanf(name, "gpio%3s%1d", group, &pin) !=3D 2) {
> +            error_setg(errp, "%s: error reading %s", __func__, name);
> +            return;
> +        }
>      }
>      set_idx =3D get_set_idx(s, group, &group_idx);
>      if (set_idx =3D=3D -1) {
> @@ -716,6 +797,21 @@ static const GPIOSetProperties ast2500_set_props[]=
 =3D {
>      [7] =3D {0x000000ff,  0x000000ff,  {"AC"} },
>  };
> =20
> +static GPIOSetProperties ast2600_3_6v_set_props[] =3D {
> +    [0] =3D {0xffffffff,  0xffffffff,  {"A", "B", "C", "D"} },
> +    [1] =3D {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
> +    [2] =3D {0xffffffff,  0xffffffff,  {"I", "J", "K", "L"} },
> +    [3] =3D {0xffffffff,  0xffffffff,  {"M", "N", "O", "P"} },
> +    [4] =3D {0xffffffff,  0xffffffff,  {"Q", "R", "S", "T"} },
> +    [5] =3D {0xffffffff,  0x0000ffff,  {"U", "V", "W", "X"} },
> +    [6] =3D {0xffff0000,  0x0fff0000,  {"Y", "Z", "", ""} },
> +};
> +
> +static GPIOSetProperties ast2600_1_8v_set_props[] =3D {
> +    [0] =3D {0xffffffff,  0xffffffff,  {"18A", "18B", "18C", "18D"} },
> +    [1] =3D {0x0000000f,  0x0000000f,  {"18E"} },
> +};
> +
>  static const MemoryRegionOps aspeed_gpio_ops =3D {
>      .read       =3D aspeed_gpio_read,
>      .write      =3D aspeed_gpio_write,
> @@ -748,7 +844,7 @@ static void aspeed_gpio_realize(DeviceState *dev, E=
rror **errp)
>      }
> =20
>      memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_gpio_ops, s,
> -            TYPE_ASPEED_GPIO, GPIO_3_6V_MEM_SIZE);
> +            TYPE_ASPEED_GPIO, GPIO_MAX_MEM_SIZE);
> =20
>      sysbus_init_mmio(sbd, &s->iomem);
>  }
> @@ -841,6 +937,26 @@ static void aspeed_gpio_2500_class_init(ObjectClas=
s *klass, void *data)
>      agc->reg_table =3D aspeed_3_6v_gpios;
>  }
> =20
> +static void aspeed_gpio_ast2600_3_6v_class_init(ObjectClass *klass, vo=
id *data)
> +{
> +    AspeedGPIOClass *agc =3D ASPEED_GPIO_CLASS(klass);
> +
> +    agc->props =3D ast2600_3_6v_set_props;
> +    agc->nr_gpio_pins =3D 208;
> +    agc->nr_gpio_sets =3D 7;
> +    agc->reg_table =3D aspeed_3_6v_gpios;
> +}
> +
> +static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass, vo=
id *data)
> +{
> +    AspeedGPIOClass *agc =3D ASPEED_GPIO_CLASS(klass);
> +
> +    agc->props =3D ast2600_1_8v_set_props;
> +    agc->nr_gpio_pins =3D 36;
> +    agc->nr_gpio_sets =3D 2;
> +    agc->reg_table =3D aspeed_1_8v_gpios;
> +}
> +
>  static const TypeInfo aspeed_gpio_info =3D {
>      .name           =3D TYPE_ASPEED_GPIO,
>      .parent         =3D TYPE_SYS_BUS_DEVICE,
> @@ -864,11 +980,27 @@ static const TypeInfo aspeed_gpio_ast2500_info =3D=
 {
>      .instance_init  =3D aspeed_gpio_init,
>  };
> =20
> +static const TypeInfo aspeed_gpio_ast2600_3_6v_info =3D {
> +    .name           =3D TYPE_ASPEED_GPIO "0-ast2600",
> +    .parent         =3D TYPE_ASPEED_GPIO,
> +    .class_init     =3D aspeed_gpio_ast2600_3_6v_class_init,
> +    .instance_init  =3D aspeed_gpio_init,
> +};
> +
> +static const TypeInfo aspeed_gpio_ast2600_1_8v_info =3D {
> +    .name           =3D TYPE_ASPEED_GPIO "1-ast2600",
> +    .parent         =3D TYPE_ASPEED_GPIO,
> +    .class_init     =3D aspeed_gpio_ast2600_1_8v_class_init,
> +    .instance_init  =3D aspeed_gpio_init,
> +};
> +
>  static void aspeed_gpio_register_types(void)
>  {
>      type_register_static(&aspeed_gpio_info);
>      type_register_static(&aspeed_gpio_ast2400_info);
>      type_register_static(&aspeed_gpio_ast2500_info);
> +    type_register_static(&aspeed_gpio_ast2600_3_6v_info);
> +    type_register_static(&aspeed_gpio_ast2600_1_8v_info);
>  }
> =20
>  type_init(aspeed_gpio_register_types);
>=20


