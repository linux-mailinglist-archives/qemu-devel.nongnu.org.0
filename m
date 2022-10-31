Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 686A0613661
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:31:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opTwy-0001CN-N7; Mon, 31 Oct 2022 08:31:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1opTwg-00012E-5D
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:31:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1opTwd-0003NS-1M
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:31:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667219469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8qoj1TutyONm7jYkdeNoXSxebZ3ecgy8z4JDb+r0HqI=;
 b=RH4lu1Q1dVrP1/dow9Sul7SekxX1I8lBaMN+KiavlKYJGO/7xapFCmx4s88VAsC8CQdUq6
 eSKkydfZRHd/98unEF33JL2cVk4uRloeDiOnY2IpZxRBclbLLGFRdJYAVBntYhY/x1xvPv
 Ou3ijJRU5bque9G2FzPvQHfNnf6zYz0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-587-Jd7sJId1P3GHEBjs4xg_fg-1; Mon, 31 Oct 2022 08:31:08 -0400
X-MC-Unique: Jd7sJId1P3GHEBjs4xg_fg-1
Received: by mail-qv1-f72.google.com with SMTP id
 on28-20020a056214449c00b004bbf12d7976so1032200qvb.18
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8qoj1TutyONm7jYkdeNoXSxebZ3ecgy8z4JDb+r0HqI=;
 b=ogx18eEPh7SMlz0p/C2HF9XIwYxCXGdIhbh+KoJl8m9YHeeIImFoZ2kmdiitGUxk7Z
 6vCyvTYhDe5nyJ2bL0EP9mYfJenxYBpKupV1TC1rlgNyffz/D3o+LYZjFtmYKpwKZCwY
 QYgwtU1Gps+qGXtUZnntzY9h4mjEsUhD7pI7Xp/ytQMxJnE2i5V7Dng1OqYFYBZyPVAJ
 E6QPutQJ0aMgcbCCVj3kto3k5uFxZFTBLX22GOQySOsncDIWzbR96P6hxGb5u/r7MlYs
 iXA8JlME06QdKoYK2pUL01M2XCssFwp9LsUJtbY+PX0XluAGRIA795LskRcdxrwLGdEO
 KQtw==
X-Gm-Message-State: ACrzQf1yAZoMMYwN3eXqLn5QUjVHm4LzmDvjC49g6U7XIf3bKI0UpzP5
 jB5+StoTxRB2MNtH2Ya8DlBvV3yGAWC9MgZMivXirHvDFeFh8p0ZMlDpo9har5sZuRE5pGR57az
 go+vOeZnnT+riqk8=
X-Received: by 2002:a05:620a:152e:b0:6fa:3cb8:dd9c with SMTP id
 n14-20020a05620a152e00b006fa3cb8dd9cmr491899qkk.82.1667219467501; 
 Mon, 31 Oct 2022 05:31:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6FNgow/rmG0ctdGlj77nVi76W3OLkTZPX7a0tS8ZqesaS8AjmbVuKCsZQqvd9QKw/5V9jIbg==
X-Received: by 2002:a05:620a:152e:b0:6fa:3cb8:dd9c with SMTP id
 n14-20020a05620a152e00b006fa3cb8dd9cmr491876qkk.82.1667219467250; 
 Mon, 31 Oct 2022 05:31:07 -0700 (PDT)
Received: from fedora (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a05620a445400b006eeae49537bsm4598105qkp.98.2022.10.31.05.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:31:06 -0700 (PDT)
Date: Mon, 31 Oct 2022 13:31:04 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] bios-tables-test: do not ignore allowed diff list
Message-ID: <20221031133104.2e4946d8@fedora>
In-Reply-To: <20221031065126-mutt-send-email-mst@kernel.org>
References: <20221027151135.496368-1-mst@redhat.com>
 <20221031114942.36e1dc83@fedora>
 <20221031065126-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 31 Oct 2022 06:52:11 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Oct 31, 2022 at 11:49:42AM +0100, Igor Mammedov wrote:
> > On Thu, 27 Oct 2022 11:11:48 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> > > we had such a beautiful structure for updating
> > > expected files, designed to keep bisect working.
> > > It turns out that we ignored the result of
> > > the allow list checks unless all tables matched
> > > anyway.
> > > 
> > > Sigh.  
> > 
> > strange,
> > it seems to be working fine (I mean white-listing) here  
> 
> it's pretty clear no? if we only check test_acpi_find_diff_allowed
> when all tables match anyway, it won't help test pass.

currently all_tables_match is accumulated value that starts with 'true'
and with the meaning 'do not explode unless at least a table was not
explicitly whitelisted'
[...]
> > >  
> > > -        all_tables_match = all_tables_match &&
  '&&' here serves as a trigger that lets flip always initial 'all_tables_match = true'

> > > +        all_tables_match = all_tables_match ||
  once it changes to '||' the all_tables_match will never flip to false
and trigger
  g_assert(all_tables_match);
at the end, when there is unexpected (non-whitelisted) table mismatch.

Am I missing something?

> > >              test_acpi_find_diff_allowed(exp_sdt);
> > >  
> > >          /*  
> 


