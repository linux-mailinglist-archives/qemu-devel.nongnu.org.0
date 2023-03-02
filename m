Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1851E6A8067
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:55:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXgag-0002Ab-HP; Thu, 02 Mar 2023 05:55:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXgad-00029D-GL
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:55:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXgab-0003Jt-KT
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:55:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677754508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HsZKqPyXmkcDK+HT2f/lQGqJ4IpXfDJksnmqf9kYf3s=;
 b=XA+M3mDllu6RBhGbddzkUH22O1363HWUheSBvFh6scNhr12M1mSE6OMWaEER/WDcOQ5qzc
 vpKGbktfhiEQmKvoxDsaLTZflCwGJcte2ICX4EzpqYXRuqsYMTopVTJlkxk5lEHr3LCoUs
 Pg6UtcN+JnF3j6mqwOBaQlEl9kjIPHg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-440-roSyVQT0OF6jj0BT8q5TDQ-1; Thu, 02 Mar 2023 05:55:06 -0500
X-MC-Unique: roSyVQT0OF6jj0BT8q5TDQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l23-20020a7bc457000000b003e206cbce8dso5598712wmi.7
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 02:55:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677754505;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HsZKqPyXmkcDK+HT2f/lQGqJ4IpXfDJksnmqf9kYf3s=;
 b=08CotCbpgsZn3u+od5yeiMGFbAihU3lUjdmoy2eVT47JXSz8o7o1ATXtMvZL9W9JsK
 Uj41YMfel3Svnyy7V7RKS95N0yq5yEM2kbDhW93KkDkux/59wwOx2xR83xvFvxTIOmSF
 gzdszCOjTFoL1QvrBZ19BaFg5J9+5qFcL+hW3VqqME95z9Etqa35ZrbCHaEpEOOQ2Q1Q
 X1029oESZoX1pFpiTexxNbsMGzrvnal6t5DENh4EzO12Nf30uqoPASO2jfzikleAnpSv
 +9ZI+mZYN+vISPav5vHU8OTZc2fBCZhi5YpeLoK4HrMLthZ9LqflACAQ+OF6HMYgVaQ+
 WCag==
X-Gm-Message-State: AO0yUKUtWtKya1pESZaYGUPwZ5SVcfKf5EZYi2ehmu1pPPMSFHRi3Pxz
 GRzHTutic/ft20DEbVCNHCUPuzHR3xw/NcHdFN3hAXAK1HQT3HqUQ8MqL23hamExm1WIclPuPGV
 lpKEdnAfe2gAqoJs=
X-Received: by 2002:adf:e490:0:b0:2c5:52b7:af88 with SMTP id
 i16-20020adfe490000000b002c552b7af88mr7506254wrm.36.1677754505770; 
 Thu, 02 Mar 2023 02:55:05 -0800 (PST)
X-Google-Smtp-Source: AK7set9Bz1ETeVLbkAgoJhRoz5X1b26yvRxTkNJ7YTYQJ5Ast6MnrsN3KSMBzTepCps+Tcl7yOcyJw==
X-Received: by 2002:adf:e490:0:b0:2c5:52b7:af88 with SMTP id
 i16-20020adfe490000000b002c552b7af88mr7506241wrm.36.1677754505469; 
 Thu, 02 Mar 2023 02:55:05 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 y1-20020adfdf01000000b002c6d0462163sm15069232wrl.100.2023.03.02.02.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 02:55:04 -0800 (PST)
Date: Thu, 2 Mar 2023 05:55:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 qemu <qemu-devel@nongnu.org>, Ben Widawsky <bwidawsk@kernel.org>,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Ira Weiny <ira.weiny@intel.com>, Gregory Price <gourry.memverge@gmail.com>,
 Mike Maslenkin <mike.maslenkin@gmail.com>,
 Dave Jiang <dave.jiang@intel.com>, Markus Armbruster <armbru@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v6 8/8] hw/mem/cxl_type3: Add CXL RAS Error Injection
 Support.
Message-ID: <20230302055254-mutt-send-email-mst@kernel.org>
References: <20230227112751.6101-1-Jonathan.Cameron@huawei.com>
 <20230227112751.6101-9-Jonathan.Cameron@huawei.com>
 <20230302100608.00005bcd@huawei.com>
 <e9287de7-94a6-944b-1627-3fa8f7f1a9bc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9287de7-94a6-944b-1627-3fa8f7f1a9bc@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 02, 2023 at 11:49:52AM +0100, Philippe Mathieu-Daudé wrote:
> On 2/3/23 11:06, Jonathan Cameron wrote:
> > +CC Michael Roth.
> > 
> > Michael Tsirkin noted I'd missed CCing QAPI maintaintainers on the
> > poison injection series so I went back to check the others I had out for review.
> > For this series I'd managed to pick up one of two as Markus gave comments on
> > earlier versions.
> 
> Now LGTM for meson/QAPI (although I'm not a QAPI maintainer).
> 
> Hopefully MST can take your series just in time for soft freeze.


Bottleneck is QAPI right now. Consider CC Eric and maybe Daniel
because Daniel is awesome and has been helping out with lots
of stuff among them QAPI.

> > On Mon, 27 Feb 2023 11:27:51 +0000
> > Jonathan Cameron via <qemu-devel@nongnu.org> wrote:
> > 
> > > CXL uses PCI AER Internal errors to signal to the host that an error has
> > > occurred. The host can then read more detailed status from the CXL RAS
> > > capability.
> > > 
> > > For uncorrectable errors: support multiple injection in one operation
> > > as this is needed to reliably test multiple header logging support in an
> > > OS. The equivalent feature doesn't exist for correctable errors, so only
> > > one error need be injected at a time.
> > > 
> > > Note:
> > >   - Header content needs to be manually specified in a fashion that
> > >     matches the specification for what can be in the header for each
> > >     error type.
> > > 
> > > Injection via QMP:
> > > { "execute": "qmp_capabilities" }
> > > ...
> > > { "execute": "cxl-inject-uncorrectable-errors",
> > >    "arguments": {
> > >      "path": "/machine/peripheral/cxl-pmem0",
> > >      "errors": [
> > >          {
> > >              "type": "cache-address-parity",
> > >              "header": [ 3, 4]
> > >          },
> > >          {
> > >              "type": "cache-data-parity",
> > >              "header": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
> > >          },
> > >          {
> > >              "type": "internal",
> > >              "header": [ 1, 2, 4]
> > >          }
> > >          ]
> > >    }}
> > > ...
> > > { "execute": "cxl-inject-correctable-error",
> > >      "arguments": {
> > >          "path": "/machine/peripheral/cxl-pmem0",
> > >          "type": "physical"
> > >      } }
> > > 
> > > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > ---
> > > v6: (Thanks to Philippe Mathieu-Daudé)
> > > - Add Since entries in cxl.json
> > > - Add error prints in the stub functions so that if they are called without
> > >    CONFIG_CXL_MEM_DEVICE then we get a useful print rather than just silently
> > >    eating them.
> > > ---
> > >   hw/cxl/cxl-component-utils.c   |   4 +-
> > >   hw/mem/cxl_type3.c             | 281 +++++++++++++++++++++++++++++++++
> > >   hw/mem/cxl_type3_stubs.c       |  17 ++
> > >   hw/mem/meson.build             |   2 +
> > >   include/hw/cxl/cxl_component.h |  26 +++
> > >   include/hw/cxl/cxl_device.h    |  11 ++
> > >   qapi/cxl.json                  | 128 +++++++++++++++
> > >   qapi/meson.build               |   1 +
> > >   qapi/qapi-schema.json          |   1 +
> > >   9 files changed, 470 insertions(+), 1 deletion(-)


