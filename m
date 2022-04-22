Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5AD50B79D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:49:44 +0200 (CEST)
Received: from localhost ([::1]:49176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhsjH-0001Od-RL
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nhrtC-000711-Rv
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:55:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nhrtB-0005im-CH
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:55:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650628552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=++FU/d/OQCa8FcV0OMbNG9lxCDwQWdsFCuo0SpWlD2g=;
 b=ZNrUM5x5sZ/FpdUHzwbe1wKFal1F6nCGEnJElI2f2XYBiJtgZ5E0ycGClLpgWJA1AOLeKt
 AbwQOc+lJo80Qkmsil265YGDTSEpUdMJ3D2jviOgfmC1d1JC8TBNnpaLGVHt74dXazOuop
 Wwl2LhNuusJY1/iRTdn3l7GkDLOp/Z8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-MKl19rFPP6iEIrxUb9wYkg-1; Fri, 22 Apr 2022 07:55:51 -0400
X-MC-Unique: MKl19rFPP6iEIrxUb9wYkg-1
Received: by mail-wm1-f72.google.com with SMTP id
 bh11-20020a05600c3d0b00b003928fe7ba07so3669565wmb.6
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 04:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=++FU/d/OQCa8FcV0OMbNG9lxCDwQWdsFCuo0SpWlD2g=;
 b=ATTRaL5pnStPfcRXtEjVD7rVUSWMJNG9WCQ1GBVivVw3CYgkZZLhIv1JHfqBSpKTmx
 zIYhW/jmVmKeKGg7j66zXROAi8KlCBXYxTkb2d3UhN+WEhTZQaPEb1aUiunm28cx8xlo
 d20LsrYaKr/ZhbcnwBo0VBxJzup+CpfY3yZ4HfU36owddFFNwJe/Y0f4wj66HQEJL8iI
 coVkHZpn98Kp+tn5oDtAo6lw2ur3m9CUd/VtfgJHixH5VBs8mu1MNqAbGcKWjGEoM0+P
 PHW8lFeeOi5htFITw15s+fB93fJCKKA+vmuA/10xnF6BVhgCk52s/fY072HIOSifcXsY
 F54w==
X-Gm-Message-State: AOAM5331Obh3qkJmiIGSAQmrMDz1LM34aIgbhNdWOOJhBXCQJ5xgjNMS
 zGebvL9XprsBRCtz5H3yoxO2lKsp8RkzPIub33rp/WHa7MSDFGwZj08vkYAY/UXt0bupNaoz7HW
 CACIn4iMntHk0mVc=
X-Received: by 2002:a05:6000:1005:b0:20a:ca74:b2c5 with SMTP id
 a5-20020a056000100500b0020aca74b2c5mr1967759wrx.149.1650628550213; 
 Fri, 22 Apr 2022 04:55:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeObCc12H8iX9GWOOIHpih3wzkG7bSO0/F9oAoaAU6vVzUo/+aXQLsPfrR133a/FrA5o61HQ==
X-Received: by 2002:a05:6000:1005:b0:20a:ca74:b2c5 with SMTP id
 a5-20020a056000100500b0020aca74b2c5mr1967741wrx.149.1650628550042; 
 Fri, 22 Apr 2022 04:55:50 -0700 (PDT)
Received: from ?IPv6:2a0c:5a80:1306:2f00:cfcf:62cf:6f38:dd92?
 ([2a0c:5a80:1306:2f00:cfcf:62cf:6f38:dd92])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a5d568e000000b00207ae498882sm1523350wrv.32.2022.04.22.04.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 04:55:49 -0700 (PDT)
Message-ID: <e98a6994d14b9481b053b90a53983f86c0846adc.camel@redhat.com>
Subject: Re: [PATCH v4 2/3] util/main-loop: Introduce the main loop into QOM
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Date: Fri, 22 Apr 2022 13:55:49 +0200
In-Reply-To: <e69cf686fcffa1d352e27e9a5ab0cc50cdf4ea42.camel@redhat.com>
References: <20220401093523.873508-1-nsaenzju@redhat.com>
 <20220401093523.873508-3-nsaenzju@redhat.com> <87r15pz7z2.fsf@pond.sub.org>
 <e69cf686fcffa1d352e27e9a5ab0cc50cdf4ea42.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, eduardo@habkost.net, hreitz@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2022-04-22 at 13:40 +0200, Nicolas Saenz Julienne wrote:
> > > +##
> > > +{ 'struct': 'EventLoopBaseProperties',
> > > +  'data': { '*aio-max-batch': 'int' } }
> > > +
> > >  ##
> > >  # @IothreadProperties:
> > >  #
> > > @@ -516,17 +527,26 @@
> > >  #               algorithm detects it is spending too long polling without
> > >  #               encountering events. 0 selects a default behaviour (default: 0)
> > >  #
> > > -# @aio-max-batch: maximum number of requests in a batch for the AIO engine,
> > > -#                 0 means that the engine will use its default
> > > -#                 (default:0, since 6.1)
> > > +# The @aio-max-batch option is available since 6.1.
> > 
> > This separates the member's "since" information from its defintion.
> > Can't be helped, because its defined in the base type, but the since
> > only applies here.  Okay.
> 
> IIUC my compromise of having the 'since version' annotated on each externally
> visible type is good, right? No need to add the info in
> EventLoopBaseProperties.

OK, nevermind this reply. I misunderstood you. I'll:
 - Add a "since 7.1" in EventLoopBaseProperties.
 - Add a special comment in IothreadProperties mentioning aio-max-batch is
   available since 6.1.
 - Remove version info from MainLoopProperties.

Thanks!

-- 
Nicolás Sáenz


