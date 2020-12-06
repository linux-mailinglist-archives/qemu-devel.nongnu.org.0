Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D92F2D04A4
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 12:53:21 +0100 (CET)
Received: from localhost ([::1]:41032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klsbQ-0007kw-MJ
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 06:53:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klsT7-00055k-10
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 06:44:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klsT3-0004t2-Ra
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 06:44:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607255076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tZXxlmip3UJX6yGlyIgsDnK7mPJ3tnvBbLBupu0EVok=;
 b=CcrFV46SPY9EUDq6o96W3t2YXWYKtUNICmSNcnsTh2ZyOACOvaHZYrnHeWNcsINEh2MKMC
 4g0SSE1NcMFrkdXH60lPT1vLtK0xOMUaC4glGSvQO4TLGEn5qIbv16p4iWnoxtErNDKPEe
 atMg81RyTjVL9FxBfaY5fF6ogZzJlWI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-YBWAcW_2NCKlr5GDsHXBDQ-1; Sun, 06 Dec 2020 06:44:34 -0500
X-MC-Unique: YBWAcW_2NCKlr5GDsHXBDQ-1
Received: by mail-ed1-f69.google.com with SMTP id cm4so918607edb.0
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 03:44:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gb1NB+VKhx1qglii/87a8VFdxSPfk/gkQbmJrasuEx8=;
 b=MC7SoHLyzocstIs2h67/vcDVEXnOIB+SAFb2uhjQMCaBLV2pCCX/O4tXqlFDeeESZG
 BpYmRPaCmFavFglWNCm9GVv0xpyPgz6i435HTdnR5j7MS9qqz26wywtBuHf4sc/OGaL/
 +CXqxG1ZnNWXTQVXNmcgMSy7maoj6Sat5ArKrimLv5O2I/EOY9lwtimgLBkolaWLkz80
 9snrJjoWedf17iAXX8t8EmT2xV1bB8Amee8tlz0q2TA28aNXCqPX9OaCCemWvQxvHJzT
 nc04VgrfscDrM8XS7suLPDDsBO5Z5/xqtKeUwZJasHJadxgZWnxjQFXbV2SVd8OUILgB
 k8rA==
X-Gm-Message-State: AOAM531Ai3G+JY/erOVQNOi4KkA4meAvmFcPzHxf0vXs2NC0yZSGRHKs
 YGwX4roV/tTequ/RPvGV4av2goIrazkSej0Gi5P+0XUjcFt195WSSsEqiMWPdSySq46xpDwBvfI
 aYlVA02xzbSR5v5I=
X-Received: by 2002:a50:e791:: with SMTP id b17mr15366460edn.388.1607255072982; 
 Sun, 06 Dec 2020 03:44:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZRbokI1keyCjJZfR9/MMjJ1yKWvyX8ngzX9EHZgkkQcHpOhyOBjXrjnHRncrHKmQQpRdh4A==
X-Received: by 2002:a50:e791:: with SMTP id b17mr15366451edn.388.1607255072821; 
 Sun, 06 Dec 2020 03:44:32 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id n13sm7941050ejr.93.2020.12.06.03.44.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Dec 2020 03:44:32 -0800 (PST)
Subject: Re: [PATCH 1/1] ui/gtk: Launching GTK UI with OpenGL on causes the
 refreshrate update to not run
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Nikola Pavlica <pavlica.nikola@gmail.com>, qemu-devel@nongnu.org
References: <55ZWKQ.X7E8ESP709H31@gmail.com>
 <7f71dd8d-fe2f-f8f5-ac34-9a49ac4771b6@redhat.com>
Message-ID: <23b420d9-f3af-3827-8ca5-dd6e854cfc94@redhat.com>
Date: Sun, 6 Dec 2020 12:44:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <7f71dd8d-fe2f-f8f5-ac34-9a49ac4771b6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 12:42 PM, Philippe Mathieu-Daudé wrote:
> Hi Nikola,
> 
> On 12/6/20 11:43 AM, Nikola Pavlica wrote:
>> I've discussed this issue back January and September. But it still
>> occurs on my machine, despite the two patches.

Oh, also, instead of "my machine", please provide more information about
your setup (installed versions), so we might eventually reproduce.

> This time, the issue is
>> that the UI refresh rate doesn't get updated when I launch QEMU with
>> gl=on. My fix for this issue is to move the code for updating the
>> refresh rate above the code that checks for OpenGL.
>>
>> Or because OpenGL is meant to be called back with the "render" callback,
>> should we instead add the refresh 
>> rate checking code there?
> 
> This is not my area, but I think you are right, the the refresh rate
> should be updated in the "render" callback.
> 
> To speed things you can send another patch, and Gerd will pick the
> correct/best one :)
> 
>> Anyway, regardless of method, I'm happy with any solution that just
>> fixes the issue.
>> Signed-off-by: Nikola Pavlica (pavlica.nikola@gmail.com)---


