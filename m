Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B4E50FE42
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 15:06:14 +0200 (CEST)
Received: from localhost ([::1]:34412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njKtR-0003AZ-3m
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 09:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1njKnT-0004v2-CP
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 09:00:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1njKnP-0001cF-7v
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 09:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650977992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N0CG3Wzi77hCdUbqEsiD23MLH0obF0y6eIRuB5WPnM0=;
 b=bBTvUkKHgZKASN96XHfkbPueb+/LwYY6lA1cLANAad9Zs6XxocOHfLmr7C4wCfYVZ/RkMb
 Q03Xyrm4ro7uV/VKN+Hy57Pw/g2Bjg2qwnu38ENvP30qn2g78dGjB1ua46GVrjKw5SPkAs
 51xX+CU7mV2N4xt9th7YhOo5mm/zJK8=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-Ug0dkCnIOV-dLuKwFcaoaA-1; Tue, 26 Apr 2022 08:59:50 -0400
X-MC-Unique: Ug0dkCnIOV-dLuKwFcaoaA-1
Received: by mail-io1-f72.google.com with SMTP id
 141-20020a6b0193000000b00657a6dd5cedso1060517iob.15
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 05:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N0CG3Wzi77hCdUbqEsiD23MLH0obF0y6eIRuB5WPnM0=;
 b=XBEgIL456G+BwKse91nuAibUKwgTG7eM0hPV2sOmuvZCpbOPiLtJ7trvR14hbTWjdf
 g4Kn3VuhbhErEBNKssF8fRDd+0Geul8khXQCq4UmSYdIg72zSBxTHL9VkoRkghfmOgaK
 FWwDzMyjW8AFcWOTfZk8WzLXpmsj9phXVUn3tkt129fZfXaA+vo0HyyVPPpYfGKzfrBK
 lB6QLm3Hk1nUZ85xuO5vBoP2iGJj3KSq3jUgkDMdnOMqBnV0H7/iRNnHLpAfULi6W39p
 nL7NBibHKOT1z7lLiBCju3sFvMTvrmYuZhS7gnJJPgxR0Q5Y3uMjIvu3DIJjrI4NlbyX
 26Zw==
X-Gm-Message-State: AOAM533EVO7DCMXRatP9AHL/prl+yNMeiscqcOctGGuhFPTgF9OZKf/5
 MMXZOPRS09pWlkuwBo9LkVT6+F3qNvxh0sGo5lxolFvaGQBFtbQL+f8+QcmRf5ZfMJ48eqMjak9
 LO21eI9INAKrmcQw=
X-Received: by 2002:a5d:8754:0:b0:64c:fc47:ab2d with SMTP id
 k20-20020a5d8754000000b0064cfc47ab2dmr9818878iol.137.1650977990028; 
 Tue, 26 Apr 2022 05:59:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygs3vC0rJZoLl4o0CwjMwAhXNYmo9p1WPzSYPsca7jv0JnpfHZ2n7d83ZQ1RvjbOoVixhJ+Q==
X-Received: by 2002:a5d:8754:0:b0:64c:fc47:ab2d with SMTP id
 k20-20020a5d8754000000b0064cfc47ab2dmr9818863iol.137.1650977989802; 
 Tue, 26 Apr 2022 05:59:49 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a05660229d200b0064c719946a8sm9884551ioq.34.2022.04.26.05.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 05:59:49 -0700 (PDT)
Date: Tue, 26 Apr 2022 08:59:47 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v9 5/7] multifd: multifd_send_sync_main now returns
 negative on error
Message-ID: <Ymfsw8kjkgaH1ysR@xz-m1.local>
References: <20220425215055.611825-1-leobras@redhat.com>
 <20220425215055.611825-6-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220425215055.611825-6-leobras@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 25, 2022 at 06:50:54PM -0300, Leonardo Bras wrote:
> Even though multifd_send_sync_main() currently emits error_reports, it's
> callers don't really check it before continuing.
> 
> Change multifd_send_sync_main() to return -1 on error and 0 on success.
> Also change all it's callers to make use of this change and possibly fail
> earlier.
> 
> (This change is important to next patch on  multifd zero copy
> implementation, to make it sure an error in zero-copy flush does not go
> unnoticed.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


