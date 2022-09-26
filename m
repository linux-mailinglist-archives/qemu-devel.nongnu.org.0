Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F765EB386
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 23:49:09 +0200 (CEST)
Received: from localhost ([::1]:48650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocvyP-0002sb-1c
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 17:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1ocvoZ-0007NY-Vh
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:39:02 -0400
Received: from outgoing-exchange-3.mit.edu ([18.9.28.13]:50694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1ocvoT-0005d4-4F
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:38:57 -0400
Received: from oc11exedge2.exchange.mit.edu (OC11EXEDGE2.EXCHANGE.MIT.EDU
 [18.9.3.18])
 by outgoing-exchange-3.mit.edu (8.14.7/8.12.4) with ESMTP id 28QLbW5s009479;
 Mon, 26 Sep 2022 17:38:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1664228318; bh=IGOJhB6hG0Wx7I2KeVj7WbFcBb1oJxGsEUMn3GpP5LM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=FQ7HzQjUdnLLaXHL9+r8mJr0iWAKiFzSKqf8TeWdm8G4iVaNwUBcSkGISYACS9pwo
 Psunj5mp6iyqLYfdppIqhotgonBhk17ymtscCtScry79tZAdWn5bPVmUI6bhfWmemj
 W3Dfmatm6VlEiqMiR0Ne5tJ4SQPPvnV6qA87xQfvPdEjHTd8lsorR90yMadqlLESxr
 11lL04EKKoANn/AjA8zy88nu3f2EmsLCwrN0cJ2WwyKBLZJtFfK6KSGCkjgkzpxDA1
 s9SdZVCrf+AycPK4hbGI4XuHMpbld2dAQAnWwpEvHUdr2ILUBOfrd7rItLNJJQ3MDl
 3VJm4vGZR7xpA==
Received: from oc11expo31.exchange.mit.edu (18.9.4.104) by
 oc11exedge2.exchange.mit.edu (18.9.3.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.38; Mon, 26 Sep 2022 17:37:28 -0400
Received: from oc11expo31.exchange.mit.edu (18.9.4.104) by
 oc11expo31.exchange.mit.edu (18.9.4.104) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 26 Sep 2022 17:37:49 -0400
Received: from oc11expo31.exchange.mit.edu ([18.9.4.104]) by
 oc11expo31.exchange.mit.edu ([18.9.4.104]) with mapi id 15.00.1497.023; Mon,
 26 Sep 2022 17:37:49 -0400
From: "Andrew S. Fasano" <fasano@mit.edu>
To: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "erdnaxe@crans.org"
 <erdnaxe@crans.org>, "ma.mandourr@gmail.com" <ma.mandourr@gmail.com>
Subject: Re: [RFC 3/4] tcg/plugins: Support for inter-plugin interactions
Thread-Topic: [RFC 3/4] tcg/plugins: Support for inter-plugin interactions
Thread-Index: AQHYvjCsJ8pIkhntuEGnHhFgbwqeeq3qWgsAgAgKAaA=
Date: Mon, 26 Sep 2022 21:37:49 +0000
Message-ID: <1664228269288.86972@mit.edu>
References: <20220901182734.2987337-1-fasano@mit.edu>
 <20220901182734.2987337-4-fasano@mit.edu>,<8735ck7nwx.fsf@linaro.org>
In-Reply-To: <8735ck7nwx.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [129.55.200.20]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=18.9.28.13; envelope-from=fasano@mit.edu;
 helo=outgoing-exchange-3.mit.edu
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

> Andrew Fasano <fasano@mit.edu> writes:=0A=
> =0A=
> > Expand tcg-plugin system to allow for plugins to export functions=0A=
> > and callbacks that can be used by other plugins. Exported functions=0A=
> > can be called at runtime by other loaded plugins. Loaded plugins=0A=
> > can register functions with exported callbacks and have these=0A=
> > functions run whenever the callback is triggered.=0A=
> =0A=
> Could you please split the callback and function handling in future=0A=
> patches to aid review.=0A=
=0A=
Will do, now that I see your response I understand why that would've been=
=0A=
better.=0A=
=0A=
> =0A=
> >=0A=
> > Signed-off-by: Andrew Fasano <fasano@mit.edu>=0A=
> > ---=0A=
> >  include/qemu/plugin-qpp.h    | 252 +++++++++++++++++++++++++++++++++++=
=0A=
> >  plugins/core.c               |  11 ++=0A=
> >  plugins/loader.c             |  24 ++++=0A=
> >  plugins/plugin.h             |   5 +=0A=
> >  plugins/qemu-plugins.symbols |   1 +=0A=
> >  5 files changed, 293 insertions(+)=0A=
> >  create mode 100644 include/qemu/plugin-qpp.h=0A=
> >=0A=
> > diff --git a/include/qemu/plugin-qpp.h b/include/qemu/plugin-qpp.h=0A=
> > new file mode 100644=0A=
> > index 0000000000..befa4f9b8b=0A=
> > --- /dev/null=0A=
> > +++ b/include/qemu/plugin-qpp.h=0A=
> > @@ -0,0 +1,252 @@=0A=
> > +#ifndef PLUGIN_QPP_H=0A=
> > +#define PLUGIN_QPP_H=0A=
> > +=0A=
> > +/*=0A=
> > + * Facilities for "QEMU plugin to plugin" (QPP) interactions between t=
cg=0A=
> > + * plugins.  These allow for an inter-plugin callback system as well=
=0A=
> > + * as direct function calls between loaded plugins. For more details s=
ee=0A=
> > + * docs/devel/plugin.rst.=0A=
> > + */=0A=
> > +=0A=
> > +#include <dlfcn.h>=0A=
> > +#include <gmodule.h>=0A=
> > +#include <assert.h>=0A=
> > +extern GModule * qemu_plugin_name_to_handle(const char *);=0A=
> =0A=
> Plugin API functions should have /** */ kernel-doc annotations for the=0A=
> benefit of the autogenerated API docs. Moreover handles to plugins are=0A=
> usually anonymous pointer types to discourage them fishing about in the=
=0A=
> contents.=0A=
> =0A=
> The fact we expose GModule to the plugin to do the linking makes me=0A=
> think that maybe the linking should be pushed into loader and be done on=
=0A=
> behalf of the plugin.=0A=
[snip]=0A=
> This house keeping definitely makes me think event handling would be=0A=
> better handled inside of the core plugin code. Instead of jumping=0A=
> through macro hoops to track state you could have something like:=0A=
> =0A=
>   void * handle =3D qemu_plugin_register_event_trigger("plugin name", "ev=
ent name")=0A=
>   ...=0A=
>   qemu_plugin_trigger_event(handle, void *ev_data);=0A=
> =0A=
> and then on the listener side:=0A=
> =0A=
>   qemu_plugin_register_event_listener("plugin name", "event name",  my_fn=
, user_data);=0A=
>   ...=0A=
>   my_fun(void *ev_data, void *udata) {=0A=
>     .. do stuff ..=0A=
>   }=0A=
>  =0A=
> it would also allow both plugins and the core code to introspect which=0A=
> events have been added.=0A=
> =0A=
You have thoroughly convinced me that this logic would be better in the cor=
e=0A=
plugin code. I'll try to make that change such that plugins can be designed=
=0A=
like your example above.=0A=
=0A=
> > +=0A=
> > +=0A=
> > +/*=0A=
> > + * QPP_RUN_CB(name, args...) should be run by the plugin that created=
=0A=
> > + * a callback whenever it wishes to trigger the callback functions tha=
t=0A=
> > + * have been registered with its previously-created callback of the pr=
ovided=0A=
> > + * name. If this macro is run with a callback name that was not previo=
usly=0A=
> > + * created, a compile time error will be raised.=0A=
> > + */=0A=
> > +#define QPP_RUN_CB(cb_name, ...) do {                           \=0A=
> > +  int cb_idx;                                                   \=0A=
> > +  for (cb_idx =3D 0; cb_idx < qpp_##cb_name##_num_cb; cb_idx++) { \=0A=
> > +    if (qpp_##cb_name##_cb[cb_idx] !=3D NULL) {                   \=0A=
> > +      qpp_##cb_name##_cb[cb_idx](__VA_ARGS__);                  \=0A=
> > +    }                                                           \=0A=
> > +  }                                                             \=0A=
> > +} while (false)=0A=
> > +=0A=
> > +/*=0A=
> > + * A header file that defines a callback function should use=0A=
> > + * the QPP_CB_PROTOTYPE macro to create the necessary types.=0A=
> > + */=0A=
> > +#define QPP_CB_PROTOTYPE(fn_ret, name, ...) \=0A=
> > +  typedef fn_ret(PLUGIN_CONCAT(name, _t))(__VA_ARGS__);=0A=
> =0A=
> If we stick to a single event prototype with event data (which can be=0A=
> specified by the other plugin header) and user data that should be=0A=
> flexible enough and avoid additional complications?=0A=
> =0A=
=0A=
Sure, removing the magic to handle variable argument would simplify=0A=
the implementation while keeping the flexibility here.=0A=
=0A=
> > +=0A=
> > +/*=0A=
> > + *********************************************************************=
********=0A=
> > + * The QPP_REG_CB and QPP_REMOVE_CB macros are to be used by plugins t=
hat=0A=
> > + * wish to run internal logic when another plugin determines that some=
 event=0A=
> > + * has occured. The plugin name, target callback name, and a local fun=
ction=0A=
> > + * are provided to these macros.=0A=
> > + *********************************************************************=
********=0A=
> > + */=0A=
> > +=0A=
> > +/*=0A=
> > + * When a plugin wishes to register a function `cb_func` with a callba=
ck=0A=
> > + * `cb_name` provided `other_plugin`, it must use the QPP_REG_CB.=0A=
> > + */=0A=
> > +#define QPP_REG_CB(other_plugin, cb_name, cb_func)      \=0A=
> > +{                                                       \=0A=
> > +  dlerror();                                            \=0A=
> > +  void *h =3D qemu_plugin_name_to_handle(other_plugin);   \=0A=
> > +  if (!h) {                                             \=0A=
> > +    fprintf(stderr, "In trying to add plugin callback, "\=0A=
> > +                    "couldn't load %s plugin\n",        \=0A=
> > +                    other_plugin);                      \=0A=
> > +    assert(h);                                          \=0A=
> > +  }                                                     \=0A=
> > +  void (*add_cb)(cb_name##_t fptr);                     \=0A=
> > +  if (g_module_symbol(h, "qpp_add_cb_" #cb_name,        \=0A=
> > +                      (gpointer *) &add_cb)) {          \=0A=
> > +    add_cb(cb_func);                                    \=0A=
> > +  } else {                                              \=0A=
> > +    fprintf(stderr, "Could not find symbol " #cb_name   \=0A=
> > +            " in " #other_plugin "\n");                 \=0A=
> > +  }                                                     \=0A=
> =0A=
> Another benefit of doing the linking in loader would be more graceful=0A=
> handling of the error cases and reporting.=0A=
Agreed.=0A=
> =0A=
> > +}=0A=
> > +=0A=
> > +/*=0A=
> > + * If a plugin wishes to disable a previously-registered `cb_func` it =
should=0A=
> > + * use the QPP_REMOVE_CB macro.=0A=
> > + */=0A=
> > +#define QPP_REMOVE_CB(other_plugin, cb_name, cb_func)            \=0A=
> > +{                                                                \=0A=
> > +  dlerror();                                                     \=0A=
> > +  void *op =3D panda_get_plugin_by_name(other_plugin);             \=
=0A=
> > +  if (!op) {                                                     \=0A=
> > +    fprintf(stderr, "In trying to remove plugin callback, "      \=0A=
> > +                    "couldn't load %s plugin\n", other_plugin);  \=0A=
> > +    assert(op);                                                  \=0A=
> > +  }                                                              \=0A=
> > +  void (*rm_cb)(cb_name##_t fptr) =3D (void (*)(cb_name##_t))      \=
=0A=
> > +                                    dlsym(op, "qpp_remove_cb_"   \=0A=
> > +                                              #cb_name);         \=0A=
> > +  assert(rm_cb !=3D 0);                                            \=
=0A=
> > +  rm_cb(cb_func);                                                \=0A=
> > +}=0A=
> > +=0A=
> > +/*=0A=
> > + *********************************************************************=
********=0A=
> > + * The QPP_FUN_PROTOTYPE enables a plugin to expose a local function t=
o other=0A=
> > + * plugins. The macro should be used in a header file that is included=
=0A=
> > + * by both the plugin that defines the function as well as other plugi=
ns=0A=
> > + * that wish to call the function.=0A=
> > + *********************************************************************=
********=0A=
> > + */=0A=
> > +=0A=
> > +/*=0A=
> > + * A header file that defines an exported function should use the=0A=
> > + * QPP_FUN_PROTOTYPE to create the necessary types. When other plugins=
=0A=
> > + * include this header, a function pointer named `[plugin_name]_[fn]` =
will=0A=
> > + * be created and available for the plugin to call.=0A=
> > + *=0A=
> > + * Note that these functions are not callbacks, but instead regular=0A=
> > + * functions that are exported by one plugin such that they can be cal=
led by=0A=
> > + * others.=0A=
> > + *=0A=
> > + * In particular, this macro will create a function pointer by combini=
ng the=0A=
> > + * `plugin_name` with an underscore and the name provided in `fn`. It =
will=0A=
> > + * create a function to run on plugin load, that initializes this func=
tion=0A=
> > + * pointer to the function named `fn` inside the plugin named `plugin_=
name`.=0A=
> > + * If this fails, an error will be printed and the plugin will abort.=
=0A=
> =0A=
> This replicates a bunch of what the QEMU_PLUGIN_EXPORT does but also=0A=
> adds some concatenation rules. Would it not be enough just to export the=
=0A=
> name and then restrict the linking in loader.c to searching plugins in a=
=0A=
> declared list from the source plugin?=0A=
> =0A=
=0A=
I don't think so, but I could certainly be wrong. From what I understand,=
=0A=
QEMU_PLUGIN_EXPORT just makes the labeled function globally visible so its=
=0A=
address can be resolved with dlsym after it's loaded with dlopen.=0A=
=0A=
The initial version of the code I shared here handles this by using macros=
=0A=
that create a constructor that runs on plugin load. Inside these constructo=
rs,=0A=
the macro-generated code uses the new qemu_plugin_name_to_handle function=
=0A=
to get a handle to the target plugin, then g_module_symbol to map that to=
=0A=
a function pointer. Finally, with this function pointer in hand, it sets up=
=0A=
the function name such that it can be called.=0A=
=0A=
This could be redesigned to move more of this logic into the plugin core an=
d=0A=
keep the plugins from directly working with the opaque handles, but I belie=
ve=0A=
some macros would still be necessary to make the target function name=0A=
into an object that could be called. This change would shorten the=0A=
QPP_FUN_PROTOTYPE macro to something more like this:=0A=
=0A=
#define QPP_FUN_PROTOTYPE(plugin_name, fn_ret, fn, args)                   =
   \=0A=
  fn_ret fn(args);                                                         =
   \=0A=
  typedef fn_ret(*PLUGIN_CONCAT(fn, _t))(args);                            =
   \=0A=
  fn##_t QPP_NAME(plugin_name, fn);                                        =
   \=0A=
  void _QPP_SETUP_NAME(plugin_name, fn) (void);                            =
   \=0A=
                                                                           =
   \=0A=
  void __attribute__ ((constructor)) _QPP_SETUP_NAME(plugin_name, fn) (void=
) {\=0A=
    qemu_plugin_initialize_qpp_fn_or_error(CURRENT_PLUGIN, plugin_name,    =
   \=0A=
                                           #fn, &QPP_NAME(plugin_name, fn))=
    \=0A=
  }=0A=
=0A=
Then some of the logic could move to `qemu_plugin_initialize_qpp_fn_or_erro=
r`=0A=
which would be in the plugin core core and responsible for handling the=0A=
dynamic linking or raising an error. It could also support logging when=0A=
plugins load references to one another and (if desired) handle automaticall=
y=0A=
loading plugins as necessary.=0A=
=0A=
Does that seem like an improvement? Or if there's something I'm missing tha=
t=0A=
would allow plugins to more easily call functions in another with various=
=0A=
type signatures and without needing to manually cast function pointers, I'm=
=0A=
all ears!=0A=
=0A=
> > + *=0A=
> > + * There are three distinct cases this macro must handle:=0A=
> > + * 1) When the header is loaded by the plugin that defines the functio=
n.=0A=
> > + *    In this case, we do not need to find the symbol externally.=0A=
> > + *    qemu_plugin_name_to_handle will return NULL, we see that the=0A=
> > + *    target plugin matches CURRENT_PLUGIN and do nothing.=0A=
> > + * 2) When the header is loaded by another plugin but the function=0A=
> > + *    is not available (i.e., the target plugin isn't loaded or the=0A=
> > + *    target plugin does not export the requested function). In this c=
ase we=0A=
> > + *    raise a fatal error.=0A=
> > + * 3) When the header is loaded by another plugin. In this case=0A=
> > + *    we need to get a handle to the target plugin and then use=0A=
> > + *    g_module_symbol to resolve the symbol and store it as the fn_nam=
e.=0A=
> > + *    If we get the handle, but can't resolve the symbol, raise a fata=
l error.=0A=
> > + *=0A=
> > + * This plugin creates the following local variables and functions:=0A=
> > + *=0A=
> > + * 1) `fn`: A prototype for the provided function, with the specified =
arguments.=0A=
> > + *    This is necessary for case 1 above and irrelevant for the others=
.=0A=
> > + * 2) A function pointer typedef for `[fn]_t` set to a pointer of the =
type of=0A=
> > + *    `fn`.=0A=
> > + * 3) A function pointer (of type `[fn]_t`) named `[plugin_name]_[fn]`=
=0A=
> > + * 4) A constructor function named "_qpp_setup_[plugin_name]_[fn]" tha=
t will=0A=
> > + *    run when the plugin is loaded. In case 1 above, it will do nothi=
ng. In=0A=
> > + *    case 2 it will print an error to stderr and abort. In case 3 it =
will=0A=
> > + *    update the function pointer "[plugin_name]_[fn]" to point to the=
 target=0A=
> > + *    function.=0A=
> > + *=0A=
> > + * After this constructor runs, the plugin can directly call the targe=
t function=0A=
> > + * using `[plugin_name]_[fn]()`.=0A=
> > + *=0A=
> > + * For example, consider a plugin named "my_plugin" that wishes to exp=
ort a=0A=
> > + * function  named "my_func" that returns void and takes a single inte=
ger arg.=0A=
> > + * This would work as follows:=0A=
> > + * 1) The header file for the plugin, my_plugin.h, should include=0A=
> > + *    QPP_FUN_PROTOTYPE(my_plugin, void, my_func, int) which will defi=
ne the=0A=
> > + *    function prototype and necessary internal state.=0A=
> > + * 2) This header should be included by my_plugin.c which should also =
include=0A=
> > + *    QEMU_PLUGIN_EXPORT void my_func(int) {...} with the function def=
inition.=0A=
> > + * 3) Other plugins can get access to this function by including my_pl=
ugin.h=0A=
> > + *    which will set up the function pointer `my_plugin_my_func` autom=
atically=0A=
> > + *    using the internal state here.=0A=
> > + *=0A=
> > + */=0A=
> > +#define QPP_FUN_PROTOTYPE(plugin_name, fn_ret, fn, args)              =
        \=0A=
> > +  fn_ret fn(args);                                                    =
        \=0A=
> > +  typedef fn_ret(*PLUGIN_CONCAT(fn, _t))(args);                       =
        \=0A=
> > +  fn##_t QPP_NAME(plugin_name, fn);                                   =
        \=0A=
> > +  void _QPP_SETUP_NAME(plugin_name, fn) (void);                       =
        \=0A=
> > +                                                                      =
        \=0A=
> > +  void __attribute__ ((constructor)) _QPP_SETUP_NAME(plugin_name, fn) =
(void) {\=0A=
> > +    GModule *h =3D qemu_plugin_name_to_handle(#plugin_name);          =
          \=0A=
> > +    if (!h && strcmp(CURRENT_PLUGIN, #plugin_name) !=3D 0) {        \=
=0A=
> > +      fprintf(stderr, "Error plugin %s cannot access %s. Is it loaded?=
\n",    \=0A=
> > +                       CURRENT_PLUGIN, #plugin_name);             \=0A=
> > +      abort();                                                        =
        \=0A=
> > +    } else if (h && !g_module_symbol(h, #fn,                          =
        \=0A=
> > +                           (gpointer *)&QPP_NAME(plugin_name, fn))) { =
        \=0A=
> > +      fprintf(stderr, "Error loading symbol " # fn " from plugin "    =
        \=0A=
> > +                      # plugin_name "\n");                            =
        \=0A=
> > +      abort();                                                        =
        \=0A=
> > +    }                                                                 =
        \=0A=
> > +  }=0A=
> =0A=
> While nothing stops a plugin calling abort() itself I'd rather avoid=0A=
> having it inserted by macro magic. Another argument for doing this=0A=
> inside the core code.=0A=
=0A=
Sounds good to me.=0A=
=0A=
> =0A=
> > +=0A=
> > +#endif /* PLUGIN_QPP_H */=0A=
> > diff --git a/plugins/core.c b/plugins/core.c=0A=
> > index 792262da08..81c714bbf4 100644=0A=
> > --- a/plugins/core.c=0A=
> > +++ b/plugins/core.c=0A=
> > @@ -236,6 +236,17 @@ void qemu_plugin_vcpu_exit_hook(CPUState *cpu)=0A=
> >      qemu_rec_mutex_unlock(&plugin.lock);=0A=
> >  }=0A=
> > =0A=
> > +GModule *qemu_plugin_name_to_handle(const char* name)=0A=
> > +{=0A=
> > +    struct qemu_plugin_ctx *ctx;=0A=
> > +    QTAILQ_FOREACH(ctx, &plugin.ctxs, entry) {=0A=
> > +        if (is_plugin_named(*ctx, name)) {=0A=
> > +            return plugin_id_to_ctx_locked(ctx->id)->handle;=0A=
> =0A=
> The _locked prefix in QEMU indicated the function expects a lock to be=0A=
> held. In this case you could use QEMU_LOCK_GUARD(&plugin.lock); at the=0A=
> head of the function.=0A=
=0A=
Thanks, I didn't know that.=0A=
=0A=
> =0A=
> > +        }=0A=
> > +    }=0A=
> > +    return NULL;=0A=
> > +}=0A=
> > +=0A=
> >  struct plugin_for_each_args {=0A=
> >      struct qemu_plugin_ctx *ctx;=0A=
> >      qemu_plugin_vcpu_simple_cb_t cb;=0A=
> > diff --git a/plugins/loader.c b/plugins/loader.c=0A=
> > index 88c30bde2d..26d3c14661 100644=0A=
> > --- a/plugins/loader.c=0A=
> > +++ b/plugins/loader.c=0A=
> > @@ -265,6 +265,30 @@ static int plugin_load(struct qemu_plugin_desc *de=
sc, const qemu_info_t *info, E=0A=
> >      return 1;=0A=
> >  }=0A=
> > =0A=
> > +/**=0A=
> > + * is_plugin_named - compare a plugins's name to a provided name=0A=
> > + * @ctx: the ctx for the plugin in question=0A=
> > + * @name: the name that should be used in the comparison=0A=
> > + *=0A=
> > + * Returns true if the names match.=0A=
> > + */=0A=
> > +=0A=
> > +bool is_plugin_named(struct qemu_plugin_ctx ctx, const char *name)=0A=
> > +{=0A=
> > +  char *plugin_basename =3D basename(ctx.desc->path);=0A=
> > +  /*=0A=
> > +   * First resolve the name of the shared object for the current plugi=
n,=0A=
> > +   * then check if it could possibly be of the form libNAME.so=0A=
> > +   * where NAME is the provided name. If so, compare the strings.=0A=
> > +   */=0A=
> > +  if (plugin_basename =3D=3D NULL || strlen(plugin_basename) !=3D strl=
en(name) + 6) {=0A=
> > +    return false;=0A=
> > +  }=0A=
> > +=0A=
> > +  return strncmp(plugin_basename + 3, name,=0A=
> > +                 strlen(plugin_basename) - 6) =3D=3D 0;=0A=
> =0A=
> I'd rather favour just making plugin names mandatory with the API boost.=
=0A=
=0A=
I agree.=0A=
=0A=
> =0A=
> > +}=0A=
> > +=0A=
> >  /* call after having removed @desc from the list */=0A=
> >  static void plugin_desc_free(struct qemu_plugin_desc *desc)=0A=
> >  {=0A=
> > diff --git a/plugins/plugin.h b/plugins/plugin.h=0A=
> > index 5eb2fdbc85..69d9b09d4c 100644=0A=
> > --- a/plugins/plugin.h=0A=
> > +++ b/plugins/plugin.h=0A=
> > @@ -97,4 +97,9 @@ void plugin_register_vcpu_mem_cb(GArray **arr,=0A=
> > =0A=
> >  void exec_inline_op(struct qemu_plugin_dyn_cb *cb);=0A=
> > =0A=
> > +GModule *qemu_plugin_name_to_handle(const char* name);=0A=
> =0A=
> exported functions shouldn't need to be declared twice, but as above we=
=0A=
> can drop this I think.=0A=
> =0A=
> > +=0A=
> > +/* loader.c */=0A=
> > +bool is_plugin_named(struct qemu_plugin_ctx ctx, const char *name);=0A=
> > +=0A=
> >  #endif /* PLUGIN_H */=0A=
> > diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbol=
s=0A=
> > index 71f6c90549..d98c0bc38a 100644=0A=
> > --- a/plugins/qemu-plugins.symbols=0A=
> > +++ b/plugins/qemu-plugins.symbols=0A=
> > @@ -18,6 +18,7 @@=0A=
> >    qemu_plugin_mem_size_shift;=0A=
> >    qemu_plugin_n_max_vcpus;=0A=
> >    qemu_plugin_n_vcpus;=0A=
> > +  qemu_plugin_name_to_handle;=0A=
> >    qemu_plugin_outs;=0A=
> >    qemu_plugin_path_to_binary;=0A=
> >    qemu_plugin_register_atexit_cb;=0A=
> =0A=
> =0A=
> --=0A=
> Alex Benn=E9e=0A=

