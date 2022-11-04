Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A84A3619607
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 13:17:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqvby-0006CW-7P; Fri, 04 Nov 2022 08:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqvbr-0006C1-AQ
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 08:15:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqvbp-0006Hw-8T
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 08:15:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667564140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sz7ZUMxqNXUoyS4fishLyGqyjwKvQtDLJShgC8NWzkY=;
 b=Iu0GMhdiSOt0oytbr0KVkzVvDVv+vOnR4zfDxPfeNsMS30byN9n2H/0quxXW676iUgi0VM
 LtRu+Qn4TLwgCPaY7CEWqjrn0Wbl/B2C2WpR+Oml6epL5yecC0wZ0lUG3zINt1M9RLF6+6
 gH9TTbGOt0f2MzgH14Ma5tAXIPnXiqI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-144-3HsE114oP4GsbkhesdIxGQ-1; Fri, 04 Nov 2022 08:15:39 -0400
X-MC-Unique: 3HsE114oP4GsbkhesdIxGQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m17-20020a05600c3b1100b003cf9cc47da5so165807wms.9
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 05:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sz7ZUMxqNXUoyS4fishLyGqyjwKvQtDLJShgC8NWzkY=;
 b=buk/QZTchSR/2Lio0ICD8HC5PZKa6HAT6N10NSh6octhn6Sd7baGS3Zt7irAACFQSU
 deBDDtGL6BAgcaBkFmJeri5O6YnBBpn2Q9RKP0HsZ3NKRWjhkliMBlQOvtP6rm1/24lb
 Yk3Otkj+JlJi0Q3dovpolHIjp1bn/NwDK55TzjKUGbNlWiIzQg6ctpJzCHw24Fo/FoCQ
 AlSW3MVm7CEYgYxBdnO4fa818YVN1EJ55404JcoejRyrzhW2RSNO7AURL13E5GeFJok9
 gneQZ8czXu4lj1IcbsIXawaveFbr+UTDdlPd45BZeANCF4+ZeHJyOTk0NsLTKTlB5raD
 EzNw==
X-Gm-Message-State: ACrzQf20JxJ2e3fhpcEdx6xOieor6G+qRl0AQcSnaqoY867X+czslNPh
 jWwAq0rs/sWcGrST8gDIrRCn8ILRcpihwX+3H1EcibqdcidbUDEIIWynvhAize3FKXMRruIwGD6
 SuIAY2uMzyBEdhRE=
X-Received: by 2002:a05:600c:5d3:b0:3cf:6ca4:b615 with SMTP id
 p19-20020a05600c05d300b003cf6ca4b615mr20045369wmd.185.1667564137998; 
 Fri, 04 Nov 2022 05:15:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6uLBx124E489zX6CZRZ7VcOeDlFLZxshsh8NWks7qjWS2GY0zs8oRoIysbXd7Oj/DaGc9lXg==
X-Received: by 2002:a05:600c:5d3:b0:3cf:6ca4:b615 with SMTP id
 p19-20020a05600c05d300b003cf6ca4b615mr20045352wmd.185.1667564137781; 
 Fri, 04 Nov 2022 05:15:37 -0700 (PDT)
Received: from redhat.com ([2.55.180.182]) by smtp.gmail.com with ESMTPSA id
 ay5-20020a5d6f05000000b0022e57e66824sm4076188wrb.99.2022.11.04.05.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 05:15:36 -0700 (PDT)
Date: Fri, 4 Nov 2022 08:15:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] tests/qtest: netdev: test stream and dgram backends
Message-ID: <20221104081513-mutt-send-email-mst@kernel.org>
References: <20221104092236.184792-1-lvivier@redhat.com>
 <Y2TeNFBUnwW9XZBk@redhat.com>
 <680deee3-ccf7-b32c-2dfe-189ab02463d4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <680deee3-ccf7-b32c-2dfe-189ab02463d4@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Nov 04, 2022 at 11:58:29AM +0100, Laurent Vivier wrote:
> On 11/4/22 10:41, Daniel P. Berrangé wrote:
> ...
> > > +static void test_stream_unix(void)
> > > +{
> > > +    QTestState *qts0, *qts1;
> > > +    char *expect;
> > > +    gchar *path;
> > > +    int ret;
> > > +
> > > +    ret = g_file_open_tmp("netdev-XXXXXX", &path, NULL);
> > > +    g_assert_true(ret >= 0);
> > > +    close(ret);
> > 
> > This is creating a zero length plain file, and then paassing
> > that as a path for the UNIX socket.
> > 
> > This is pretty dubious and only works because the code will
> > be doing 'unlink' on the path. Just delete this as there's
> > no reason to pre-create anything on disk for UNIX sockets.
> > 
> 
> The idea here is to generate a path for the socket and to be sure this path
> is actually not already in use.

if you unlink before use then it's racy though.

> The same for the abstract one, how to be sure we are not running the same
> test concurrently and select a different unix name?
> 
> I'm going to address all your comments and send a new version of the patch.
> 
> Thanks,
> Laurent


