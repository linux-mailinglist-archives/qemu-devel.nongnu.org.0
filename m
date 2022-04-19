Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE7A506894
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 12:16:18 +0200 (CEST)
Received: from localhost ([::1]:56914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngku9-0000M0-1f
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 06:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1ngkqs-0007ME-A2
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 06:12:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1ngkqo-00013m-IV
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 06:12:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650363168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bbq0LSnnvjXAaJfy/kZ71qiN9KWOdaaSiZP6H+tGcls=;
 b=hRYrs2QjfPVBVGUGIRXijMKILqiby/07kRa2PmuPOUjpR6TjcVqmuAaPrZtV1b2PqOWAjO
 LaA2jA5L0SwDzXx2C6/yoFk5gvhSefuhZS+qCN7Sq4MME90wLKo+WjwGxwoM8HgLPt/a6g
 k+yZIMEWpMR1+/UlLuAgqIypkS2vhM4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-AfFWd1HzNYKLjxvRbWZJXA-1; Tue, 19 Apr 2022 06:12:47 -0400
X-MC-Unique: AfFWd1HzNYKLjxvRbWZJXA-1
Received: by mail-wm1-f72.google.com with SMTP id
 d6-20020a05600c34c600b0039296a2ac7cso1006402wmq.1
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 03:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Bbq0LSnnvjXAaJfy/kZ71qiN9KWOdaaSiZP6H+tGcls=;
 b=jJqsWX1KfLzv77N+BctRs/Sj23GXQzSY9tHby8DcpgbvoI20qeD2XwQgS40XQgl3WR
 peKbPwr+IBFB5KU+SyAi2iU5Knb272cbH1JY94T1oSOcafXSXaVH0wnsDWGZPUCBeny2
 WKul3ZOslqpB063c30gFpFqUJDHFgv+b0rjv7Kx6Po0sL45Lrajy4lMlwtWqHAQmoH7u
 LQT4dUFcdAdkdHKvMj1RY8fUgYVWzF5Sho9YhCcQSrDNMrY4qwi6ul6hbsqagTt12sgx
 hiHqn3E2jYrAFbknbHBI9fsp30iziio+wRzxGTVk3YZ6SUhD3SJgrpvewVt7HYF43RRE
 jRrQ==
X-Gm-Message-State: AOAM530VIrIPTMLZmsipKBZE1IsttRFaJgU3qNNn1wBrg8kQGUZONr5x
 wkpnZp2Cf0ceB5FSyA0pLe/lGf5J3hMkV4FqBDU8qUf2wPtwCVV5WSGDMMH/UWt0IvTQGHHYLBN
 weH2cPnOXTJxcxQw=
X-Received: by 2002:a5d:6b0d:0:b0:1f0:6497:b071 with SMTP id
 v13-20020a5d6b0d000000b001f06497b071mr11322065wrw.638.1650363166628; 
 Tue, 19 Apr 2022 03:12:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyizMH8jQ6cdZZDcbk1UgdzRs4UQsUTny6suBfX7sM1rSB+74XeYYKeNpaNxdIMoyowJXTJKQ==
X-Received: by 2002:a5d:6b0d:0:b0:1f0:6497:b071 with SMTP id
 v13-20020a5d6b0d000000b001f06497b071mr11322045wrw.638.1650363166381; 
 Tue, 19 Apr 2022 03:12:46 -0700 (PDT)
Received: from ?IPv6:2a0c:5a80:1306:2f00:cfcf:62cf:6f38:dd92?
 ([2a0c:5a80:1306:2f00:cfcf:62cf:6f38:dd92])
 by smtp.gmail.com with ESMTPSA id
 t15-20020adfeb8f000000b002060d26c211sm12491566wrn.114.2022.04.19.03.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 03:12:45 -0700 (PDT)
Message-ID: <ee82ff2e39c1ec66de4931a9145fdd8cd409afb2.camel@redhat.com>
Subject: Re: [PATCH v4 0/4] util/thread-pool: Expose minimun and maximum size
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: armbru <armbru@redhat.com>
Date: Tue, 19 Apr 2022 12:12:43 +0200
In-Reply-To: <Ykq6edsYQjtdEzcz@stefanha-x1.localdomain>
References: <20220401093523.873508-1-nsaenzju@redhat.com>
 <Ykq6edsYQjtdEzcz@stefanha-x1.localdomain>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, eduardo@habkost.net,
 hreitz@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2022-04-04 at 10:29 +0100, Stefan Hajnoczi wrote:
> On Fri, Apr 01, 2022 at 11:35:20AM +0200, Nicolas Saenz Julienne wrote:
> > As discussed on the previous RFC[1] the thread-pool's dynamic thread
> > management doesn't play well with real-time and latency sensitive
> > systems. This series introduces a set of controls that'll permit
> > achieving more deterministic behaviours, for example by fixing the
> > pool's size.
> > 
> > We first introduce a new common interface to event loop configuration by
> > moving iothread's already available properties into an abstract class
> > called 'EventLooopBackend' and have both 'IOThread' and the newly
> > created 'MainLoop' inherit the properties from that class.
> > 
> > With this new configuration interface in place it's relatively simple to
> > introduce new options to fix the even loop's thread pool sizes. The
> > resulting QAPI looks like this:
> > 
> >     -object main-loop,id=main-loop,thread-pool-min=1,thread-pool-max=1
> > 
> > Note that all patches are bisect friendly and pass all the tests.
> > 
> > [1] https://patchwork.ozlabs.org/project/qemu-devel/patch/20220202175234.656711-1-nsaenzju@redhat.com/
> > 
> > @Stefan I kept your Signed-off-by, since the changes trivial/not
> > thread-pool related
> 
> Looks good to me. I will wait for Markus to review the QAPI schema changes.

ping :)

-- 
Nicolás Sáenz


