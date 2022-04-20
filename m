Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A28B5090BE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:51:23 +0200 (CEST)
Received: from localhost ([::1]:56404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGME-00049j-O5
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nhFpv-0003Bb-R8
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:17:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nhFpu-0003MG-8S
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:17:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650482277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FRWvFUKrD/BzzxB6lkTrUviFRhRh9ESYMSP2ItGxCUE=;
 b=H2MsLv9D0HygvCJ14a3atOXdiNpczShduA38OvPnbSecWrxk6m8qmbV3+iWvuLVg9X34Oz
 VS4Dp0lr0PV49D76eP8F6aR+Dy98l6a975xzfcIylvJBWQSHTdyc6JlB6mAjnI6xi9kSFB
 nx6fJephUelJ2L4qK0b2XwV7pas3ZOM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-VQVzXdPzN6eJq69u_dskww-1; Wed, 20 Apr 2022 15:17:56 -0400
X-MC-Unique: VQVzXdPzN6eJq69u_dskww-1
Received: by mail-wm1-f70.google.com with SMTP id
 d6-20020a05600c34c600b0039296a2ac7cso1373845wmq.1
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 12:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=FRWvFUKrD/BzzxB6lkTrUviFRhRh9ESYMSP2ItGxCUE=;
 b=nqdrvfSXuN6zOeJOrIc3nJdwyCjosNJca7TkP+6hsWPq0cQtsay0Nh4OUyBmdh6QcU
 Em/A/zzjKqJtUYGR6Z8kAa/E0DS/E2qGI7sd5lPO6MYZsfexHIB9qlNI//BOSAWQSV1f
 wh06RUyEmXOkvZv9+ToXbZ98s9nBUAcc7Pf9KWP2ejDI2P7erVf8150nWrznENTBMdS0
 MehHTfXLlYnhICE0SHX+z5zzfzxjVhfK6fX/BZg+YH/sHqx00ktr1vLnmHgKErUxrTFB
 q813Vytvz6UZP5X4IEnFmS5IbuQHcVGTjcpHGwYxBcww2zqgtGno7mAF8pDkY0YLed40
 Z7LQ==
X-Gm-Message-State: AOAM531fDMGv8lcp2sSGtKf0i2TNH/FbUL6/1aAL6MCx/iCYYD+T9K5v
 kir8h3dQ2w7AXyx/0m+XtzKWKGd/jKCNYbGWaZjCvb78KxcngfC0Psom73p4dGvDMC+YmrB72mq
 X5lMgQiE+DlU8Dns=
X-Received: by 2002:a5d:5601:0:b0:207:a6a6:468c with SMTP id
 l1-20020a5d5601000000b00207a6a6468cmr16868943wrv.127.1650482274983; 
 Wed, 20 Apr 2022 12:17:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxauf+yuSEk03e6lGJSZy26agE7F6RQJGQXMUDpsFxQbxZCt3RACnsaNO3xzkiy2tZcSGJEqg==
X-Received: by 2002:a5d:5601:0:b0:207:a6a6:468c with SMTP id
 l1-20020a5d5601000000b00207a6a6468cmr16868932wrv.127.1650482274782; 
 Wed, 20 Apr 2022 12:17:54 -0700 (PDT)
Received: from ?IPv6:::1? ([2001:b07:6468:f312:e558:1d17:12d7:e67d])
 by smtp.gmail.com with ESMTPSA id
 t4-20020adfe104000000b00205b50f04f0sm505116wrz.86.2022.04.20.12.17.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Apr 2022 12:17:54 -0700 (PDT)
Date: Wed, 20 Apr 2022 21:17:48 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@gmail.com>
Subject: Re: [PATCH 07/34] configure, meson: move OpenGL check to meson
In-Reply-To: <CAJ+F1CK6464s=L2A23=WTp+qZ9+E_F_KKn_eWMbZOu-=dKO=dQ@mail.gmail.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-8-pbonzini@redhat.com>
 <CAJ+F1CK6464s=L2A23=WTp+qZ9+E_F_KKn_eWMbZOu-=dKO=dQ@mail.gmail.com>
Message-ID: <1277109B-C1B6-42A1-AE28-65DBB5B99580@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Il 20 aprile 2022 18:13:30 CEST, "Marc-Andr=C3=A9 Lureau" <marcandre=2Elur=
eau@gmail=2Ecom> ha scritto:
>> -if config_host=2Ehas_key('CONFIG_OPENGL')
>> +softmmu_ss=2Eadd(opengl)
>>
>
>I guess this line is superfluous

It's needed for the include path, iirc=2E

Paolo

>
>
>> +if opengl=2Efound()
>>    opengl_ss =3D ss=2Esource_set()
>>    opengl_ss=2Eadd(gbm)
>> -  opengl_ss=2Eadd(when: [opengl, pixman, 'CONFIG_OPENGL'],
>> +  opengl_ss=2Eadd(when: [opengl, pixman],
>>                 if_true: files('shader=2Ec', 'console-gl=2Ec',
>> 'egl-helpers=2Ec', 'egl-context=2Ec'))
>>    ui_modules +=3D {'opengl' : opengl_ss}
>>  endif
>>
>> -if config_host=2Ehas_key('CONFIG_OPENGL') and gbm=2Efound()
>> +if opengl=2Efound() and gbm=2Efound()
>>    egl_headless_ss =3D ss=2Esource_set()
>> -  egl_headless_ss=2Eadd(when: [opengl, gbm, pixman, 'CONFIG_OPENGL'],
>> +  egl_headless_ss=2Eadd(when: [opengl, gbm, pixman],
>>                        if_true: files('egl-headless=2Ec'))
>>    ui_modules +=3D {'egl-headless' : egl_headless_ss}
>>  endif
>> @@ -98,8 +99,8 @@ if gtk=2Efound()
>>    gtk_ss =3D ss=2Esource_set()
>>    gtk_ss=2Eadd(gtk, vte, pixman, files('gtk=2Ec', 'gtk-clipboard=2Ec')=
)
>>    gtk_ss=2Eadd(when: x11, if_true: files('x_keymap=2Ec'))
>> -  gtk_ss=2Eadd(when: [opengl, 'CONFIG_OPENGL'], if_true:
>> files('gtk-gl-area=2Ec'))
>> -  gtk_ss=2Eadd(when: [x11, opengl, 'CONFIG_OPENGL'], if_true:
>> files('gtk-egl=2Ec'))
>> +  gtk_ss=2Eadd(when: opengl, if_true: files('gtk-gl-area=2Ec'))
>> +  gtk_ss=2Eadd(when: [x11, opengl], if_true: files('gtk-egl=2Ec'))
>>    ui_modules +=3D {'gtk' : gtk_ss}
>>  endif
>>
>> @@ -112,7 +113,7 @@ if sdl=2Efound()
>>      'sdl2-input=2Ec',
>>      'sdl2=2Ec',
>>    ))
>> -  sdl_ss=2Eadd(when: [opengl, 'CONFIG_OPENGL'], if_true: files('sdl2-g=
l=2Ec'))
>> +  sdl_ss=2Eadd(when: opengl, if_true: files('sdl2-gl=2Ec'))
>>    sdl_ss=2Eadd(when: x11, if_true: files('x_keymap=2Ec'))
>>    ui_modules +=3D {'sdl' : sdl_ss}
>>  endif
>> --
>> 2=2E35=2E1
>>
>>
>>
>>
>Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre=2Elureau@redhat=2Ecom>
>


