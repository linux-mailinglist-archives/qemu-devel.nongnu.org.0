Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902DB52D1D5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 13:54:59 +0200 (CEST)
Received: from localhost ([::1]:41668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrejw-0000Mm-LV
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 07:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nrehf-000811-Ed
 for qemu-devel@nongnu.org; Thu, 19 May 2022 07:52:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nrehd-0005wa-5W
 for qemu-devel@nongnu.org; Thu, 19 May 2022 07:52:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652961144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NHmLL2iYhMb0DaqR5MlHc0A6/7RLWB81wre2JxrBhZk=;
 b=fkiwSjUpDexOqTYFfpVCHOZKReINYuL0AlxJIpPb3rrXRmHZh0vdxrZbLlk4zMDG2v8V1z
 Rv5RrFzhd5/R6GlIOB2+lHXsOTh0bpHBCfFOCfzNNVO3QgLwPZNMxP16Eg6/WRD/n5qJQi
 eKNIICLd52tk3Pn4XkoE+i/9jKdTBGk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-gCjR_e7eMMiRKg3v7L2Rsw-1; Thu, 19 May 2022 07:52:23 -0400
X-MC-Unique: gCjR_e7eMMiRKg3v7L2Rsw-1
Received: by mail-wm1-f70.google.com with SMTP id
 m26-20020a7bcb9a000000b0039455e871b6so1736826wmi.8
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 04:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NHmLL2iYhMb0DaqR5MlHc0A6/7RLWB81wre2JxrBhZk=;
 b=AUrTTNHeJ7MPbYc/bnE+uvSd/1ZM3yvghnQFJL/WoR97TSaC75WGKzkxOYk6Q9A27I
 onMZ8RmlgJV40hDjXqEPO6FEY4SszP/o/XRP1H9q8nySxwRILCATdQ4D4IqfHj9SQcc1
 QrLKj5sPitIHCWw/OMZ3xOz70KCFeZr03gCJGIOZPqFQJ9/9I9IMpbWn67SI7Yh3h5VG
 k5xryIw98eVQMQqGbGGjSodbN57Fl2mdn4qPH6jTTWZR18kzcezM7DgXvHtnXTdHhBGA
 /vYFFdmZ35m1nLhTSFu6jjVN+wpH97EhNP1iq0WPvHWNbjVK67ws5wFlKqF1ImOLgcTz
 RYVw==
X-Gm-Message-State: AOAM531FLs0CeKcMG5yh38R8l7ptK8efVQVo9VJfFdS3yAt/8rAJ0Tim
 BpQuKH4YjPIstXVFzBjSeYUIHbN8PIhYUWC7JornSsAbxbRmAokpGg/emh+Ik1kziWwoUuAPNsv
 f34CluBSRnnRAQPs=
X-Received: by 2002:adf:f645:0:b0:20e:652d:2a4e with SMTP id
 x5-20020adff645000000b0020e652d2a4emr3825995wrp.344.1652961141859; 
 Thu, 19 May 2022 04:52:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBQLzEWG6wUmXZfaVj0rFhFpLbdPPB96P7CTzQYPbX99Z5pXx5KPgOi1wakVKg8rEy2iEvWQ==
X-Received: by 2002:adf:f645:0:b0:20e:652d:2a4e with SMTP id
 x5-20020adff645000000b0020e652d2a4emr3825957wrp.344.1652961141526; 
 Thu, 19 May 2022 04:52:21 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 q9-20020adf9dc9000000b0020d02ddf4d5sm4725536wre.5.2022.05.19.04.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 04:52:21 -0700 (PDT)
Date: Thu, 19 May 2022 13:52:19 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 ani@anisinha.ca, minyard@acm.org, stefanb@linux.vnet.ibm.com,
 marcandre.lureau@redhat.com
Subject: Re: [PATCH 28/35] acpi: pvpanic-isa: use
 AcpiDevAmlIfClass:build_dev_aml to provide device's AML
Message-ID: <20220519135219.73aa7e82@redhat.com>
In-Reply-To: <20220518122602-mutt-send-email-mst@kernel.org>
References: <20220516152610.1963435-1-imammedo@redhat.com>
 <20220516152610.1963435-29-imammedo@redhat.com>
 <20220516163547-mutt-send-email-mst@kernel.org>
 <20220517081351.vnx2xryjxason3dd@sirius.home.kraxel.org>
 <20220518122602-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 May 2022 12:29:25 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, May 17, 2022 at 10:13:51AM +0200, Gerd Hoffmann wrote:
> > That problem isn't new and we already have a bunch of aml_* stubs
> > because of that.  I expect it'll work just fine, at worst we'll
> > have to add a stub or two in case some calls are not covered yet.  
> 
> Right but adding these stubs is a bother, we keep missing some.
> If possible I'd like the solution to be cleaner than the status quo.
> Is adding a wrapper instead of setting a method directly such
> a big problem really?

Stubs are the bother but not much compared to alternatives.
I can't recall missing stubs recently (it's hard to miss them
as it's build time failure that won't pass CI).

However wrapper would introduce ifdeffenry instead of a stub.
And my understanding was that it's not acceptable and stubs are
what consensus approach is/was to eliminate/minimize ifdefs
in the code.

Also adding wrapper won't help anything, we also need to
decouple AML code into separate source files to avoid
dependency on AML routines and that is a bigger crunch
that includes not only new source files but spreading
CONFIG_APCI all over the tree, so I'm not sure if end
result won't be worse compared to stubs. Stubs are not
the cleanest ways around the issue but they would be
simpler to maintain in the end.


