Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348715C0134
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 17:26:05 +0200 (CEST)
Received: from localhost ([::1]:56480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob1bv-00074q-PE
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 11:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob1YV-0002uu-1x
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:22:31 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob1YR-0001Od-Jw
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:22:30 -0400
Received: by mail-wr1-x429.google.com with SMTP id bq9so10475659wrb.4
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 08:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=aL/SbTZCNENtdCtQCYXUb5BalucijGKHC1wxHjXgmKE=;
 b=RMe597BQWUB+Kb6zCmEWhNrCPBf5sF/0GdKj5d1VnYxnnLNH0IK3FhoNjJ+O5/Gnyg
 27qodE+Nbgb7qYG9RcAVbIcUTMbTRtuzGjKTaKo2t3VNUaNKrH4oYbeDBizMhf+STz7E
 7wSmQrCuerKH1POw660/o7dL36xP8G6nQvpFgs98EEBT0x8vkJcGhTxXHjV8d5kUi8fg
 gAorfDIIOKmeNrZ/S3XujRYJKMwH3DYRu6XT1aniGJgsNmQZNXWXpb0A9PSfDTtAh86k
 NfbtpnasClYM+9nj1Qa4cK+jKMoEERw0T+QwjUFCDnZl5aKYaVrkQEENYnfMruC/SxWk
 K1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=aL/SbTZCNENtdCtQCYXUb5BalucijGKHC1wxHjXgmKE=;
 b=ZebFpv4tRNW7OPDOYBTFFQAGi/+rtl+Ju9RboKnjf5bKj8K+oLDMijaxi/ZuNvZgrP
 rLJ6/JzHmBJJ6DHL507M5/RCSjcBAi9f4/+XGQGCXZGPNa3FtME8hXNQS22S1DASlyjz
 M8LPUnMzNyHAJ4/CYztIIiZomru52Cw9Z0AeUhMuMpofJ7nLRLNO6qXn24+7s2YJvVkJ
 PFiuggUdc0fu4uYvC7DjiNTNtXehqLrXpLnu+oLtEQbbOhTc53OcIioaA4B8odwANKZn
 2l5dKBmgTcQJnwdBofI7v/gRT5tBKjaT8KE3U8+VrUCpmGdbMYnVjm+h9U4EpUY2krJc
 caxw==
X-Gm-Message-State: ACrzQf0pSB9sJgtPztVeCUHEia/HfspR2RmkzmBbhvi4agxWpnBFgpOi
 Vl8O3UDfPu9TGhXBSt2ey2AEyQ==
X-Google-Smtp-Source: AMsMyM5mHe9yyKo6QAlvMO5vwy8obpNhlFfYwAa2x7Gu7X6KbbFM7xjw6qLIF4ABW/M9mMJokAK/3A==
X-Received: by 2002:a5d:6545:0:b0:228:dab8:af03 with SMTP id
 z5-20020a5d6545000000b00228dab8af03mr17807792wrv.29.1663773745240; 
 Wed, 21 Sep 2022 08:22:25 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t6-20020adfeb86000000b0022afedf3c87sm2824392wrn.105.2022.09.21.08.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 08:22:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BF9221FFB7;
 Wed, 21 Sep 2022 16:22:22 +0100 (BST)
References: <20220901182734.2987337-1-fasano@mit.edu>
 <20220901182734.2987337-4-fasano@mit.edu>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Fasano <fasano@mit.edu>
Cc: qemu-devel@nongnu.org, erdnaxe@crans.org, ma.mandourr@gmail.com
Subject: Re: [RFC 3/4] tcg/plugins: Support for inter-plugin interactions
Date: Wed, 21 Sep 2022 15:51:52 +0100
In-reply-to: <20220901182734.2987337-4-fasano@mit.edu>
Message-ID: <8735ck7nwx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

> Expand tcg-plugin system to allow for plugins to export functions
> and callbacks that can be used by other plugins. Exported functions
> can be called at runtime by other loaded plugins. Loaded plugins
> can register functions with exported callbacks and have these
> functions run whenever the callback is triggered.

Could you please split the callback and function handling in future
patches to aid review.

>
> Signed-off-by: Andrew Fasano <fasano@mit.edu>
> ---
>  include/qemu/plugin-qpp.h    | 252 +++++++++++++++++++++++++++++++++++
>  plugins/core.c               |  11 ++
>  plugins/loader.c             |  24 ++++
>  plugins/plugin.h             |   5 +
>  plugins/qemu-plugins.symbols |   1 +
>  5 files changed, 293 insertions(+)
>  create mode 100644 include/qemu/plugin-qpp.h
>
> diff --git a/include/qemu/plugin-qpp.h b/include/qemu/plugin-qpp.h
> new file mode 100644
> index 0000000000..befa4f9b8b
> --- /dev/null
> +++ b/include/qemu/plugin-qpp.h
> @@ -0,0 +1,252 @@
> +#ifndef PLUGIN_QPP_H
> +#define PLUGIN_QPP_H
> +
> +/*
> + * Facilities for "QEMU plugin to plugin" (QPP) interactions between tcg
> + * plugins.  These allow for an inter-plugin callback system as well
> + * as direct function calls between loaded plugins. For more details see
> + * docs/devel/plugin.rst.
> + */
> +
> +#include <dlfcn.h>
> +#include <gmodule.h>
> +#include <assert.h>
> +extern GModule * qemu_plugin_name_to_handle(const char *);

Plugin API functions should have /** */ kernel-doc annotations for the
benefit of the autogenerated API docs. Moreover handles to plugins are
usually anonymous pointer types to discourage them fishing about in the
contents.

The fact we expose GModule to the plugin to do the linking makes me
think that maybe the linking should be pushed into loader and be done on
behalf of the plugin.

> +
> +#define PLUGIN_CONCAT(x, y) _PLUGIN_CONCAT(x, y)
> +#define _PLUGIN_CONCAT(x, y) x##y
> +#define QPP_NAME(plugin, fn) PLUGIN_CONCAT(plugin, PLUGIN_CONCAT(_, fn))
> +#define QPP_MAX_CB 256
> +#define _QPP_SETUP_NAME(plugin, fn) PLUGIN_CONCAT(_qpp_setup_, \
> +                                    QPP_NAME(plugin, fn))
> +
> +/*
> + ***********************************************************************=
***
> + * The QPP_CREATE_CB and QPP_RUN_CB macros are to be used by a plugin th=
at
> + * wishs to create and later trigger QPP-based callback events. These are
> + * events that the plugin can detect (i.e., through analysis of guest st=
ate)
> + * that may be of interest to other plugins.
> + ***********************************************************************=
***
> + */
> +
> +/*
> + * QPP_CREATE_CB(name) will create a callback by defining necessary inte=
rnal
> + * functions and variables based off the provided name. It must be run b=
efore
> + * triggering the callback event (with QPP_RUN_CB). This macro will crea=
te the
> + * following variables and functions, based off the provided name:
> + *
> + * 1) qpp_[name]_cb is an array of function pointers storing the
> + *    registered callbacks.
> + * 2) qpp_[name]_num_cb stores the number of functions stored with this
> + *    callback.
> + * 3) qpp_add_cb_[name] is a function to add a pointer into the qpp_[nam=
e]_cb
> + *    array and increment qpp_[name]_num_cb.
> + * 4) qpp_remove_cb_[name] finds a registered callback, deletes it, decr=
ements
> + *    _num_cb and shifts the _cb array appropriately to fill the gap.
> + *
> + * Important notes:
> + *
> + * 1) Multiple callbacks can be registered for the same event, however c=
onsumers
> + *    can not control the order in which they are called and this order =
may
> + *    change in the future.
> + *
> + * 2) If this macro is incorrectly used multiple times in the same plugi=
n with
> + *    the same callback name set, it will raise a compilation error since
> + *    these variables would then be defined multiple times. The same cal=
lback
> + *    name can, however, be created in distrinct plugins without issue.
> + */
> +#define QPP_CREATE_CB(cb_name)                              \
> +void qpp_add_cb_##cb_name(cb_name##_t fptr);                \
> +bool qpp_remove_cb_##cb_name(cb_name##_t fptr);             \
> +cb_name##_t * qpp_##cb_name##_cb[QPP_MAX_CB];               \
> +int qpp_##cb_name##_num_cb;                                 \
> +                                                            \
> +void qpp_add_cb_##cb_name(cb_name##_t fptr)                 \
> +{                                                           \
> +  assert(qpp_##cb_name##_num_cb < QPP_MAX_CB);              \
> +  qpp_##cb_name##_cb[qpp_##cb_name##_num_cb] =3D fptr;        \
> +  qpp_##cb_name##_num_cb +=3D 1;                              \
> +}                                                           \
> +                                                            \
> +bool qpp_remove_cb_##cb_name(cb_name##_t fptr)              \
> +{                                                           \
> +  int i =3D 0;                                                \
> +  bool found =3D false;                                       \
> +  for (; i < MIN(QPP_MAX_CB, qpp_##cb_name##_num_cb); i++) {\
> +    if (!found && fptr =3D=3D qpp_##cb_name##_cb[i]) {          \
> +        found =3D true;                                       \
> +        qpp_##cb_name##_num_cb--;                           \
> +    }                                                       \
> +    if (found && i < QPP_MAX_CB - 2) {                      \
> +        qpp_##cb_name##_cb[i] =3D qpp_##cb_name##_cb[i + 1];  \
> +    }                                                       \
> +  }                                                         \
> +  return found;                                             \
> +}

This house keeping definitely makes me think event handling would be
better handled inside of the core plugin code. Instead of jumping
through macro hoops to track state you could have something like:

  void * handle =3D qemu_plugin_register_event_trigger("plugin name", "even=
t name")
  ...
  qemu_plugin_trigger_event(handle, void *ev_data);

and then on the listener side:

  qemu_plugin_register_event_listener("plugin name", "event name",  my_fn, =
user_data);
  ...
  my_fun(void *ev_data, void *udata) {
    .. do stuff ..
  }
=20=20
it would also allow both plugins and the core code to introspect which
events have been added.

> +
> +
> +/*
> + * QPP_RUN_CB(name, args...) should be run by the plugin that created
> + * a callback whenever it wishes to trigger the callback functions that
> + * have been registered with its previously-created callback of the prov=
ided
> + * name. If this macro is run with a callback name that was not previous=
ly
> + * created, a compile time error will be raised.
> + */
> +#define QPP_RUN_CB(cb_name, ...) do {                           \
> +  int cb_idx;                                                   \
> +  for (cb_idx =3D 0; cb_idx < qpp_##cb_name##_num_cb; cb_idx++) { \
> +    if (qpp_##cb_name##_cb[cb_idx] !=3D NULL) {                   \
> +      qpp_##cb_name##_cb[cb_idx](__VA_ARGS__);                  \
> +    }                                                           \
> +  }                                                             \
> +} while (false)
> +
> +/*
> + * A header file that defines a callback function should use
> + * the QPP_CB_PROTOTYPE macro to create the necessary types.
> + */
> +#define QPP_CB_PROTOTYPE(fn_ret, name, ...) \
> +  typedef fn_ret(PLUGIN_CONCAT(name, _t))(__VA_ARGS__);

If we stick to a single event prototype with event data (which can be
specified by the other plugin header) and user data that should be
flexible enough and avoid additional complications?

> +
> +/*
> + ***********************************************************************=
******
> + * The QPP_REG_CB and QPP_REMOVE_CB macros are to be used by plugins that
> + * wish to run internal logic when another plugin determines that some e=
vent
> + * has occured. The plugin name, target callback name, and a local funct=
ion
> + * are provided to these macros.
> + ***********************************************************************=
******
> + */
> +
> +/*
> + * When a plugin wishes to register a function `cb_func` with a callback
> + * `cb_name` provided `other_plugin`, it must use the QPP_REG_CB.
> + */
> +#define QPP_REG_CB(other_plugin, cb_name, cb_func)      \
> +{                                                       \
> +  dlerror();                                            \
> +  void *h =3D qemu_plugin_name_to_handle(other_plugin);   \
> +  if (!h) {                                             \
> +    fprintf(stderr, "In trying to add plugin callback, "\
> +                    "couldn't load %s plugin\n",        \
> +                    other_plugin);                      \
> +    assert(h);                                          \
> +  }                                                     \
> +  void (*add_cb)(cb_name##_t fptr);                     \
> +  if (g_module_symbol(h, "qpp_add_cb_" #cb_name,        \
> +                      (gpointer *) &add_cb)) {          \
> +    add_cb(cb_func);                                    \
> +  } else {                                              \
> +    fprintf(stderr, "Could not find symbol " #cb_name   \
> +            " in " #other_plugin "\n");                 \
> +  }                                                     \

Another benefit of doing the linking in loader would be more graceful
handling of the error cases and reporting.

> +}
> +
> +/*
> + * If a plugin wishes to disable a previously-registered `cb_func` it sh=
ould
> + * use the QPP_REMOVE_CB macro.
> + */
> +#define QPP_REMOVE_CB(other_plugin, cb_name, cb_func)            \
> +{                                                                \
> +  dlerror();                                                     \
> +  void *op =3D panda_get_plugin_by_name(other_plugin);             \
> +  if (!op) {                                                     \
> +    fprintf(stderr, "In trying to remove plugin callback, "      \
> +                    "couldn't load %s plugin\n", other_plugin);  \
> +    assert(op);                                                  \
> +  }                                                              \
> +  void (*rm_cb)(cb_name##_t fptr) =3D (void (*)(cb_name##_t))      \
> +                                    dlsym(op, "qpp_remove_cb_"   \
> +                                              #cb_name);         \
> +  assert(rm_cb !=3D 0);                                            \
> +  rm_cb(cb_func);                                                \
> +}
> +
> +/*
> + ***********************************************************************=
******
> + * The QPP_FUN_PROTOTYPE enables a plugin to expose a local function to =
other
> + * plugins. The macro should be used in a header file that is included
> + * by both the plugin that defines the function as well as other plugins
> + * that wish to call the function.
> + ***********************************************************************=
******
> + */
> +
> +/*
> + * A header file that defines an exported function should use the
> + * QPP_FUN_PROTOTYPE to create the necessary types. When other plugins
> + * include this header, a function pointer named `[plugin_name]_[fn]` wi=
ll
> + * be created and available for the plugin to call.
> + *
> + * Note that these functions are not callbacks, but instead regular
> + * functions that are exported by one plugin such that they can be calle=
d by
> + * others.
> + *
> + * In particular, this macro will create a function pointer by combining=
 the
> + * `plugin_name` with an underscore and the name provided in `fn`. It wi=
ll
> + * create a function to run on plugin load, that initializes this functi=
on
> + * pointer to the function named `fn` inside the plugin named `plugin_na=
me`.
> + * If this fails, an error will be printed and the plugin will abort.

This replicates a bunch of what the QEMU_PLUGIN_EXPORT does but also
adds some concatenation rules. Would it not be enough just to export the
name and then restrict the linking in loader.c to searching plugins in a
declared list from the source plugin?

> + *
> + * There are three distinct cases this macro must handle:
> + * 1) When the header is loaded by the plugin that defines the function.
> + *    In this case, we do not need to find the symbol externally.
> + *    qemu_plugin_name_to_handle will return NULL, we see that the
> + *    target plugin matches CURRENT_PLUGIN and do nothing.
> + * 2) When the header is loaded by another plugin but the function
> + *    is not available (i.e., the target plugin isn't loaded or the
> + *    target plugin does not export the requested function). In this cas=
e we
> + *    raise a fatal error.
> + * 3) When the header is loaded by another plugin. In this case
> + *    we need to get a handle to the target plugin and then use
> + *    g_module_symbol to resolve the symbol and store it as the fn_name.
> + *    If we get the handle, but can't resolve the symbol, raise a fatal =
error.
> + *
> + * This plugin creates the following local variables and functions:
> + *
> + * 1) `fn`: A prototype for the provided function, with the specified ar=
guments.
> + *    This is necessary for case 1 above and irrelevant for the others.
> + * 2) A function pointer typedef for `[fn]_t` set to a pointer of the ty=
pe of
> + *    `fn`.
> + * 3) A function pointer (of type `[fn]_t`) named `[plugin_name]_[fn]`
> + * 4) A constructor function named "_qpp_setup_[plugin_name]_[fn]" that =
will
> + *    run when the plugin is loaded. In case 1 above, it will do nothing=
. In
> + *    case 2 it will print an error to stderr and abort. In case 3 it wi=
ll
> + *    update the function pointer "[plugin_name]_[fn]" to point to the t=
arget
> + *    function.
> + *
> + * After this constructor runs, the plugin can directly call the target =
function
> + * using `[plugin_name]_[fn]()`.
> + *
> + * For example, consider a plugin named "my_plugin" that wishes to expor=
t a
> + * function  named "my_func" that returns void and takes a single intege=
r arg.
> + * This would work as follows:
> + * 1) The header file for the plugin, my_plugin.h, should include
> + *    QPP_FUN_PROTOTYPE(my_plugin, void, my_func, int) which will define=
 the
> + *    function prototype and necessary internal state.
> + * 2) This header should be included by my_plugin.c which should also in=
clude
> + *    QEMU_PLUGIN_EXPORT void my_func(int) {...} with the function defin=
ition.
> + * 3) Other plugins can get access to this function by including my_plug=
in.h
> + *    which will set up the function pointer `my_plugin_my_func` automat=
ically
> + *    using the internal state here.
> + *
> + */
> +#define QPP_FUN_PROTOTYPE(plugin_name, fn_ret, fn, args)                =
      \
> +  fn_ret fn(args);                                                      =
      \
> +  typedef fn_ret(*PLUGIN_CONCAT(fn, _t))(args);                         =
      \
> +  fn##_t QPP_NAME(plugin_name, fn);                                     =
      \
> +  void _QPP_SETUP_NAME(plugin_name, fn) (void);                         =
      \
> +                                                                        =
      \
> +  void __attribute__ ((constructor)) _QPP_SETUP_NAME(plugin_name, fn) (v=
oid) {\
> +    GModule *h =3D qemu_plugin_name_to_handle(#plugin_name);            =
        \
> +    if (!h && strcmp(CURRENT_PLUGIN, #plugin_name) !=3D 0) {        \
> +      fprintf(stderr, "Error plugin %s cannot access %s. Is it loaded?\n=
",    \
> +                       CURRENT_PLUGIN, #plugin_name);             \
> +      abort();                                                          =
      \
> +    } else if (h && !g_module_symbol(h, #fn,                            =
      \
> +                           (gpointer *)&QPP_NAME(plugin_name, fn))) {   =
      \
> +      fprintf(stderr, "Error loading symbol " # fn " from plugin "      =
      \
> +                      # plugin_name "\n");                              =
      \
> +      abort();                                                          =
      \
> +    }                                                                   =
      \
> +  }

While nothing stops a plugin calling abort() itself I'd rather avoid
having it inserted by macro magic. Another argument for doing this
inside the core code.

> +
> +#endif /* PLUGIN_QPP_H */
> diff --git a/plugins/core.c b/plugins/core.c
> index 792262da08..81c714bbf4 100644
> --- a/plugins/core.c
> +++ b/plugins/core.c
> @@ -236,6 +236,17 @@ void qemu_plugin_vcpu_exit_hook(CPUState *cpu)
>      qemu_rec_mutex_unlock(&plugin.lock);
>  }
>=20=20
> +GModule *qemu_plugin_name_to_handle(const char* name)
> +{
> +    struct qemu_plugin_ctx *ctx;
> +    QTAILQ_FOREACH(ctx, &plugin.ctxs, entry) {
> +        if (is_plugin_named(*ctx, name)) {
> +            return plugin_id_to_ctx_locked(ctx->id)->handle;

The _locked prefix in QEMU indicated the function expects a lock to be
held. In this case you could use QEMU_LOCK_GUARD(&plugin.lock); at the
head of the function.

> +        }
> +    }
> +    return NULL;
> +}
> +
>  struct plugin_for_each_args {
>      struct qemu_plugin_ctx *ctx;
>      qemu_plugin_vcpu_simple_cb_t cb;
> diff --git a/plugins/loader.c b/plugins/loader.c
> index 88c30bde2d..26d3c14661 100644
> --- a/plugins/loader.c
> +++ b/plugins/loader.c
> @@ -265,6 +265,30 @@ static int plugin_load(struct qemu_plugin_desc *desc=
, const qemu_info_t *info, E
>      return 1;
>  }
>=20=20
> +/**
> + * is_plugin_named - compare a plugins's name to a provided name
> + * @ctx: the ctx for the plugin in question
> + * @name: the name that should be used in the comparison
> + *
> + * Returns true if the names match.
> + */
> +
> +bool is_plugin_named(struct qemu_plugin_ctx ctx, const char *name)
> +{
> +  char *plugin_basename =3D basename(ctx.desc->path);
> +  /*
> +   * First resolve the name of the shared object for the current plugin,
> +   * then check if it could possibly be of the form libNAME.so
> +   * where NAME is the provided name. If so, compare the strings.
> +   */
> +  if (plugin_basename =3D=3D NULL || strlen(plugin_basename) !=3D strlen=
(name) + 6) {
> +    return false;
> +  }
> +
> +  return strncmp(plugin_basename + 3, name,
> +                 strlen(plugin_basename) - 6) =3D=3D 0;

I'd rather favour just making plugin names mandatory with the API boost.

> +}
> +
>  /* call after having removed @desc from the list */
>  static void plugin_desc_free(struct qemu_plugin_desc *desc)
>  {
> diff --git a/plugins/plugin.h b/plugins/plugin.h
> index 5eb2fdbc85..69d9b09d4c 100644
> --- a/plugins/plugin.h
> +++ b/plugins/plugin.h
> @@ -97,4 +97,9 @@ void plugin_register_vcpu_mem_cb(GArray **arr,
>=20=20
>  void exec_inline_op(struct qemu_plugin_dyn_cb *cb);
>=20=20
> +GModule *qemu_plugin_name_to_handle(const char* name);

exported functions shouldn't need to be declared twice, but as above we
can drop this I think.

> +
> +/* loader.c */
> +bool is_plugin_named(struct qemu_plugin_ctx ctx, const char *name);
> +
>  #endif /* PLUGIN_H */
> diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
> index 71f6c90549..d98c0bc38a 100644
> --- a/plugins/qemu-plugins.symbols
> +++ b/plugins/qemu-plugins.symbols
> @@ -18,6 +18,7 @@
>    qemu_plugin_mem_size_shift;
>    qemu_plugin_n_max_vcpus;
>    qemu_plugin_n_vcpus;
> +  qemu_plugin_name_to_handle;
>    qemu_plugin_outs;
>    qemu_plugin_path_to_binary;
>    qemu_plugin_register_atexit_cb;


--=20
Alex Benn=C3=A9e

