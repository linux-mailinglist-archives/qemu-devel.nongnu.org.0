Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D986A41E3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:44:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWcpj-0006Fq-Bd; Mon, 27 Feb 2023 07:42:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pWcpE-000645-H3
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:41:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pWcp2-0001w0-UF
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677501700;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xvDv44B94IXcgpa5Sk9TVvP+k6B2ZLnN/qoymhLGra0=;
 b=iTUbGJ7MZ8K+ulFOTkF0jUox2GXU2RWjXSKCTRDxgPzxGCIFl+5PdkNJvwLHd0Sws0hgUc
 RQmw23Ggmy21Sn/8LYIBnIQITN4EHXLZuXtOdv4hcwK6h+Ro9ggU+PxtIQUYXyJQ5DievY
 0vcRTGxVIH2F4J3BeHOJXSYrC/DbyAs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-VhO9SBP9M4KIHnhEak8Jqw-1; Mon, 27 Feb 2023 07:41:38 -0500
X-MC-Unique: VhO9SBP9M4KIHnhEak8Jqw-1
Received: by mail-wr1-f71.google.com with SMTP id
 bh3-20020a05600005c300b002c70d6e2014so809835wrb.10
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 04:41:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xvDv44B94IXcgpa5Sk9TVvP+k6B2ZLnN/qoymhLGra0=;
 b=vY2LsgLPWJg31jCEtdvXbvV+RdFklSwMyHsHIiwXJMfgMTAA51bvkOjLNnkjLZETce
 jom0xPKJJ6N7PErXLb+OnKwjkoSC1N602JARsmXTbuM1PTopHAt4TkxeIgQbxCkaxWLb
 Ua61i/M5JESHrPG62gok7H/mSPORqbD7UYYUJGZ+PthhopRh6aQCWOk02pAl6kQWWpJ6
 ryFTWxMGkXjMVKKeBG00tSGRE7b6k22hC/Z2i27Vmhm7vlmTmm8Bz1VtboqyPeHmHdgN
 PfmDLIMoUWumvsRcgdJhWlcp8NDjZaWL81NMae+5xak7klGF+aOQPCoqG7YMtHfdm0xW
 B1ug==
X-Gm-Message-State: AO0yUKXGBbY8W4jRKLPo9FqSkibfXQ8eG3ZZJN0PDKJYh4NbqwiPDJ97
 0TFxrEZVQSU0oMuT173PQjUWcNlUX71xdtbPRf5SkPqzBoJNgdjRprPtrdev22GbIzWyMnSzbsc
 oBk/CyHVf9zDiOdesiBGVOJo=
X-Received: by 2002:a05:600c:4a9d:b0:3ea:e7f6:f8fa with SMTP id
 b29-20020a05600c4a9d00b003eae7f6f8famr11879132wmp.10.1677501696511; 
 Mon, 27 Feb 2023 04:41:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8+S9+DQdRiE3gG6ZkRFwpHuu+OIP75LEu1cpV+g2DN1OTmxWzFyLkB6Kr6hrKpORKwOQJL6w==
X-Received: by 2002:a05:600c:4a9d:b0:3ea:e7f6:f8fa with SMTP id
 b29-20020a05600c4a9d00b003eae7f6f8famr11879116wmp.10.1677501696218; 
 Mon, 27 Feb 2023 04:41:36 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a5d4083000000b002c5a790e959sm7086696wrp.19.2023.02.27.04.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 04:41:35 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,  Gerd Hoffmann
 <kraxel@redhat.com>,  Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/2] qapi: Generate enum count as definition in
 gen_enum_lookup()
In-Reply-To: <20230224155451.20211-3-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 24 Feb 2023 16:54:51
 +0100")
References: <20230224155451.20211-1-philmd@linaro.org>
 <20230224155451.20211-3-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 27 Feb 2023 13:41:34 +0100
Message-ID: <875ybnp9fl.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> QAPI's gen_enum() generates QAPI enum values and the number
> of this values (as foo__MAX).
> The number of entries in an enum type is not part of the
> enumerated values, but we generate it as such. See for
> example:
>
>   typedef enum OnOffAuto {
>       ON_OFF_AUTO_AUTO,
>       ON_OFF_AUTO_ON,
>       ON_OFF_AUTO_OFF,
>       ON_OFF_AUTO__MAX,        <---------
>   } OnOffAuto;
>
> Instead of declaring the enum count as the last enumerated
> value, #define it, so it is not part of the enum. The previous
> example becomes:
>
>   typedef enum OnOffAuto {
>       ON_OFF_AUTO_AUTO,
>       ON_OFF_AUTO_ON,
>       ON_OFF_AUTO_OFF,
>   #define ON_OFF_AUTO__MAX 3   <---------
>   } OnOffAuto;
>
> Since Clang enables the -Wswitch warning by default [*], remove all
> pointless foo__MAX cases in switch statement, in order to avoid:
>
>  audio/audio.c:2231:10: error: case value not in enumerated type 'AudioFo=
rmat' (aka 'enum AudioFormat') [-Wswitch]
>     case AUDIO_FORMAT__MAX:
>          ^
>  ui/input.c:233:14: error: case value not in enumerated type 'KeyValueKin=
d' (aka 'enum KeyValueKind') [-Wswitch]
>         case KEY_VALUE_KIND__MAX:
>              ^
>  ...
>
> [*] https://clang.llvm.org/docs/DiagnosticsReference.html#wswitch
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

This other is very nice.

Thanks, Juan.


