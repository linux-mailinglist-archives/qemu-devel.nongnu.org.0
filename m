Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7DC5BBA60
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 22:29:56 +0200 (CEST)
Received: from localhost ([::1]:51490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZeRn-0002h4-GA
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 16:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oZeQN-0001MY-FO
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 16:28:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oZeQL-00033r-4E
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 16:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663446503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SFhR7kAt+jbcxSrK4UZahidDtoNRA4frp0eJmTuFU+k=;
 b=LH9pRZrvnp/DLNj4PPVvjV47VbM3hS4yb8f6U/KyI0+BBsuDt0xUFd6gmknfsuh0H9ixeM
 Ewv19iyXJHLfO79H200AYRybLZNXqVxjVS+KIGMaRaNxu94s7SH8vGSVoYqawUC/WCOdTr
 0+gMuF3azcz3uQovtN32nl540Bipziw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-398-oAAQ0xYJN5WnAGeeJqiDAw-1; Sat, 17 Sep 2022 16:28:22 -0400
X-MC-Unique: oAAQ0xYJN5WnAGeeJqiDAw-1
Received: by mail-wm1-f72.google.com with SMTP id
 v190-20020a1cacc7000000b003b4ab30188fso1953928wme.2
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 13:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=SFhR7kAt+jbcxSrK4UZahidDtoNRA4frp0eJmTuFU+k=;
 b=uriKhGwLO3xEBCdIgcbTR/WkHgYOqiCHq7rq3JkYAzTR0fpVKuGGMBnX/+XifF8xft
 vhlcT2/qN1M9QqWr0gdJW5Y2twyGdgqHfTq4LsA5JE7szt21tWsWGsLP5O79Eg6Kkdz8
 fupJqN++C1DGww4Vt0EUGkrHb15OrvV7yb11I9LDO03u6rXpc2ZKFpQMQBhknjm5/iNA
 curCmNDAITio1pygIySxJXZz9itoByKmmEi7uYZ7JFXalm2/OalB9OS3Wk+SGZJ7shHb
 YvWgAiRaYtO3MrM1vd2ZfRY0UPGe6BAZPHOPDFpvMWokiWMmOD9fUxNw02B8Fsqt6ggV
 a4fQ==
X-Gm-Message-State: ACrzQf3lIPNvdHF5LZQtDlhxBU3AWQg3luXTmFqK3g1s3QhBSaw86LmD
 LP0ZaCWwTjPo6vo5IM5YlBDJARl+uU3qjy5hNCD75AuOvZ42MWks3gd4B2Y0dkjfR8mueNmQshm
 52PodXkRu6kUz/oc=
X-Received: by 2002:adf:db0d:0:b0:22a:eeed:5145 with SMTP id
 s13-20020adfdb0d000000b0022aeeed5145mr2458694wri.590.1663446501198; 
 Sat, 17 Sep 2022 13:28:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7dwwhvR06wf0FoZKg8HPRqg8/MTR/oNEseVreWwGDAcAg/7syUKb9h/QoKqQZcpz0zZ8TBVw==
X-Received: by 2002:adf:db0d:0:b0:22a:eeed:5145 with SMTP id
 s13-20020adfdb0d000000b0022aeeed5145mr2458681wri.590.1663446500959; 
 Sat, 17 Sep 2022 13:28:20 -0700 (PDT)
Received: from redhat.com ([2.52.4.6]) by smtp.gmail.com with ESMTPSA id
 e1-20020adfef01000000b00226dedf1ab7sm8607303wro.76.2022.09.17.13.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Sep 2022 13:28:20 -0700 (PDT)
Date: Sat, 17 Sep 2022 16:28:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: berrange@redhat.com, imammedo@redhat.com, jsnow@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, thuth@redhat.com
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Message-ID: <20220917162606-mutt-send-email-mst@kernel.org>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca>
 <20220714163611-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207150929020.2162493@anisinha-lenovo>
 <20220715015941-mutt-send-email-mst@kernel.org>
 <CAARzgwwjXMmbRQ-ETPPqHP5eq5jtrGMSh2GeBh5fLS9Pcsut+A@mail.gmail.com>
 <20220716112943-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207251100590.87138@anisinha-lenovo>
 <alpine.DEB.2.22.394.2207271137210.130455@anisinha-lenovo>
 <CAARzgwwpy6yUJfuxxfM2vAUDqh+RyxjLqd+1xARiazqwTLbN9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAARzgwwpy6yUJfuxxfM2vAUDqh+RyxjLqd+1xARiazqwTLbN9A@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SORTED_RECIPS=2.499, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Fri, Sep 16, 2022 at 09:30:42PM +0530, Ani Sinha wrote:
> On Thu, Jul 28, 2022 at 12:08 AM Ani Sinha <ani@anisinha.ca> wrote:
> >
> >
> >
> > On Mon, 25 Jul 2022, Ani Sinha wrote:
> >
> > >
> > >
> > > On Sat, 16 Jul 2022, Michael S. Tsirkin wrote:
> > >
> > > > On Sat, Jul 16, 2022 at 12:06:00PM +0530, Ani Sinha wrote:
> > > > >
> > > > >
> > > > > On Fri, Jul 15, 2022 at 11:20 Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > >     On Fri, Jul 15, 2022 at 09:47:27AM +0530, Ani Sinha wrote:
> > > > >     > > Instead of all this mess, can't we just spawn e.g. "git clone --depth
> > > > >     1"?
> > > > >     > > And if the directory exists I would fetch and checkout.
> > > > >     >
> > > > >     > There are two reasons I can think of why I do not like this idea:
> > > > >     >
> > > > >     > (a) a git clone of a whole directory would download all versions of the
> > > > >     > binary whereas we want only a specific version.
> > > > >
> > > > >     You mention shallow clone yourself, and I used --depth 1 above.
> > > > >
> > > > >     > Downloading a single file
> > > > >     > by shallow cloning or creating a git archive is overkill IMHO when a wget
> > > > >     > style retrieval works just fine.
> > > > >
> > > > >     However, it does not provide for versioning, tagging etc so you have
> > > > >     to implement your own schema.
> > > > >
> > > > >
> > > > > Hmm I’m not sure if we need all that. Bits has its own versioning mechanism and
> > > > > I think all we need to do is maintain the same versioning logic and maintain
> > > > > binaries of different  versions. Do we really need the power of git/version
> > > > > control here? Dunno.
> > > >
> > > > Well we need some schema. Given we are not using official bits releases
> > > > I don't think we can reuse theirs.
> > >
> > > OK fine. Lets figuire out how to push bits somewhere in git.qemu.org and
> > > the binaries in some other repo first. Everything else hinges on that. We
> > > can fix the rest of the bits later incrementally.
> >
> > DanPB, any thoughts on putting bits on git.qemu.org or where and how to
> > keep the binaries?
> 
> Can we please conclude on this?
> Peter, can you please fork the repo? I have tried many times to reach
> you on IRC but failed.

Probably because of travel around KVM forum.

I think given our CI is under pressure again due to gitlab free tier
limits, tying binaries to CI isn't a great idea at this stage.
Can Ani just upload binaies to qemu.org for now?

-- 
MST


