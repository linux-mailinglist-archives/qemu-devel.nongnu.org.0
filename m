Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A771A632078
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 12:25:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox4ue-0004hX-Ea; Mon, 21 Nov 2022 06:24:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1ox4ud-0004hK-2E; Mon, 21 Nov 2022 06:24:31 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1ox4ua-0003Xm-Vi; Mon, 21 Nov 2022 06:24:30 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 75116220C7;
 Mon, 21 Nov 2022 11:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669029865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V2lBbqa7jpSZB1uLSPQaCH7TtK8NSee0HiGX7tsBu+Y=;
 b=ndmJasFcALqxKOquS7aGLq8KubR1h8F1IAtrIxPZJrvVFiK99Zk4G+bTrkFY188hY8RxJn
 bPiw3CFZALeN6X0aKfs3jUXiPovnDg5Xe/5/HWdnbgzbZQZ0AXwqncF5nFYeIhPnmfwmFm
 +354NguwsxipKHYQsGXPZi0hRhsnzmw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669029865;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V2lBbqa7jpSZB1uLSPQaCH7TtK8NSee0HiGX7tsBu+Y=;
 b=GuWaVqMlSY6nfV8xe6ipU7E4JPHCdrk1ZaRUPGNMoJ9BmTFzrb73+575Sx50jC1jeBdrG9
 PaOJLtZ/aKpyxRDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 430101376E;
 Mon, 21 Nov 2022 11:24:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QN67Dulfe2MXMQAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 21 Nov 2022 11:24:25 +0000
Message-ID: <2ebe3466-bdc2-8c31-46ee-c2d958d96944@suse.de>
Date: Mon, 21 Nov 2022 12:24:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] gtk: disable GTK Clipboard with a new option
 'gtk_clipboard'
Content-Language: en-US
To: Jim Fehlig <jfehlig@suse.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org
References: <20221108162324.23010-1-cfontana@suse.de>
 <980e2701-5271-8977-c574-f5b64e80e02b@suse.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <980e2701-5271-8977-c574-f5b64e80e02b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/18/22 23:26, Jim Fehlig wrote:
> I should make myself useful around here on occasion when items are within my 
> skill set. But I already struggle to find time for that in the libvirt community 
> :-).

Thanks for taking a look,
> 
> On 11/8/22 09:23, Claudio Fontana wrote:
>> The GTK Clipboard implementation may cause guest hangs.
>>
>> Therefore implement a new configure switch --enable-gtk-clipboard,
>> disabled by default, as a meson option.
>>
>> Regenerate the meson build options to include it.
>>
>> The initialization of the clipboard is gtk.c, as well as the
>> compilation of gtk-clipboard.c are now conditional on this new option
>> to be set.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1150
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>   meson.build                   | 9 +++++++++
>>   meson_options.txt             | 7 +++++++
>>   scripts/meson-buildoptions.sh | 3 +++
>>   ui/gtk.c                      | 2 ++
>>   ui/meson.build                | 5 ++++-
>>   5 files changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 1d448272ab..8bb96e5e8c 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -1243,6 +1243,8 @@ if nettle.found() and gmp.found()
>>   endif
>>   
>>   
>> +have_gtk_clipboard = false
> 
> Can this be initialized with get_option(), instead of the two calls below?

Yes, I think we can initialize it once here.

> 
>> +
>>   gtk = not_found
>>   gtkx11 = not_found
>>   vte = not_found
>> @@ -1258,12 +1260,18 @@ if not get_option('gtk').auto() or have_system
>>                           kwargs: static_kwargs)
>>       gtk = declare_dependency(dependencies: [gtk, gtkx11])
>>   
>> +    have_gtk_clipboard = get_option('gtk_clipboard').enabled()
>> +

... I'll remove this...

>>       if not get_option('vte').auto() or have_system
>>         vte = dependency('vte-2.91',
>>                          method: 'pkg-config',
>>                          required: get_option('vte'),
>>                          kwargs: static_kwargs)
>>       endif
>> +  else
>> +    if get_option('gtk_clipboard').enabled()
>> +      error('GTK clipboard requested, but GTK not found')
>> +    endif

... and simplify this to an

      elif have_gtk_clipboad


>>     endif
>>   endif
>>   
>> @@ -1842,6 +1850,7 @@ if glusterfs.found()
>>   endif
>>   config_host_data.set('CONFIG_GTK', gtk.found())
>>   config_host_data.set('CONFIG_VTE', vte.found())
>> +config_host_data.set('CONFIG_GTK_CLIPBOARD', have_gtk_clipboard)
>>   config_host_data.set('CONFIG_LIBATTR', have_old_libattr)
>>   config_host_data.set('CONFIG_LIBCAP_NG', libcap_ng.found())
>>   config_host_data.set('CONFIG_EBPF', libbpf.found())
>> diff --git a/meson_options.txt b/meson_options.txt
>> index 66128178bf..4b749ca549 100644
>> --- a/meson_options.txt
>> +++ b/meson_options.txt
>> @@ -219,6 +219,13 @@ option('vnc_sasl', type : 'feature', value : 'auto',
>>          description: 'SASL authentication for VNC server')
>>   option('vte', type : 'feature', value : 'auto',
>>          description: 'vte support for the gtk UI')
>> +
>> +# GTK Clipboard implementation is disabled by default, since it may cause hangs
>> +# of the guest VCPUs. See gitlab issue 1150:
>> +# https://gitlab.com/qemu-project/qemu/-/issues/1150
>> +
>> +option('gtk_clipboard', type: 'feature', value : 'disabled',
>> +       description: 'clipboard support for the gtk UI (EXPERIMENTAL, MAY HANG)')
> 
> 'boolean' seems a more appropriate type, but I see 'feature' is common practice 
> with these various options. Is gtk_clipboard marked experimental elsewhere? Is 
> there a need for the warning text?

I did not find anything else to update about the GTK UI docs, at least in docs/ .

The only other place that comes to mind is about/deprecated.rst ,
but that would be about deprecating the feature , not sure we want to do that.

In terms of whether we should warn about the experimental nature of the feature at all,
I think so, as it can hang QEMU.

> 
>>   option('xkbcommon', type : 'feature', value : 'auto',
>>          description: 'xkbcommon support')
>>   option('zstd', type : 'feature', value : 'auto',
>> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
>> index 2cb0de5601..a542853bfd 100644
>> --- a/scripts/meson-buildoptions.sh
>> +++ b/scripts/meson-buildoptions.sh
>> @@ -93,6 +93,7 @@ meson_options_help() {
>>     printf "%s\n" '  glusterfs       Glusterfs block device driver'
>>     printf "%s\n" '  gnutls          GNUTLS cryptography support'
>>     printf "%s\n" '  gtk             GTK+ user interface'
>> +  printf "%s\n" '  gtk-clipboard   clipboard support for the gtk UI (EXPERIMENTAL, MAY HANG)'
> 
> Same here. None of the other options have such warning. Cant this be treated 
> like the others, just another option to be enabled or disabled? Whether or not 
> the option works is another matter.

I'd warn the user, packager, etc that enabling this option may hang QEMU.

Hopefully these warnings can be removed as we find another way to collect the necessary GTK events
that does not incur in this bug.

> 
> Jim
> 
>>     printf "%s\n" '  guest-agent     Build QEMU Guest Agent'
>>     printf "%s\n" '  guest-agent-msi Build MSI package for the QEMU Guest Agent'
>>     printf "%s\n" '  hax             HAX acceleration support'
>> @@ -274,6 +275,8 @@ _meson_option_parse() {
>>       --disable-gprof) printf "%s" -Dgprof=false ;;
>>       --enable-gtk) printf "%s" -Dgtk=enabled ;;
>>       --disable-gtk) printf "%s" -Dgtk=disabled ;;
>> +    --enable-gtk-clipboard) printf "%s" -Dgtk_clipboard=enabled ;;
>> +    --disable-gtk-clipboard) printf "%s" -Dgtk_clipboard=disabled ;;
>>       --enable-guest-agent) printf "%s" -Dguest_agent=enabled ;;
>>       --disable-guest-agent) printf "%s" -Dguest_agent=disabled ;;
>>       --enable-guest-agent-msi) printf "%s" -Dguest_agent_msi=enabled ;;
>> diff --git a/ui/gtk.c b/ui/gtk.c
>> index 7ec21f7798..4817623c8f 100644
>> --- a/ui/gtk.c
>> +++ b/ui/gtk.c
>> @@ -2403,7 +2403,9 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
>>           opts->u.gtk.show_tabs) {
>>           gtk_menu_item_activate(GTK_MENU_ITEM(s->show_tabs_item));
>>       }
>> +#ifdef CONFIG_GTK_CLIPBOARD
>>       gd_clipboard_init(s);
>> +#endif /* CONFIG_GTK_CLIPBOARD */
>>   }
>>   
>>   static void early_gtk_display_init(DisplayOptions *opts)
>> diff --git a/ui/meson.build b/ui/meson.build
>> index ec13949776..c1b137bf33 100644
>> --- a/ui/meson.build
>> +++ b/ui/meson.build
>> @@ -97,7 +97,10 @@ if gtk.found()
>>     softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('win32-kbd-hook.c'))
>>   
>>     gtk_ss = ss.source_set()
>> -  gtk_ss.add(gtk, vte, pixman, files('gtk.c', 'gtk-clipboard.c'))
>> +  gtk_ss.add(gtk, vte, pixman, files('gtk.c'))
>> +  if have_gtk_clipboard
>> +    gtk_ss.add(files('gtk-clipboard.c'))
>> +  endif
>>     gtk_ss.add(when: x11, if_true: files('x_keymap.c'))
>>     gtk_ss.add(when: opengl, if_true: files('gtk-gl-area.c'))
>>     gtk_ss.add(when: [x11, opengl], if_true: files('gtk-egl.c'))
> 

Ciao,

Claudio

