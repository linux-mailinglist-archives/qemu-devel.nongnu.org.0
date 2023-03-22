Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1B96C5043
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 17:11:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf12k-0006va-8z; Wed, 22 Mar 2023 12:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ernunes@redhat.com>)
 id 1pf12i-0006vH-Ia
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 12:10:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ernunes@redhat.com>)
 id 1pf12f-0003GK-RX
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 12:10:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679501424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FIOEep8E4kG/BMmOrj58iW7bAbKFRG0g3uCHMKcBNds=;
 b=acOyzkNgp09hDrVYHdfwL9tbKYyu18tvvTSlU8eyQf1MplgU8szOGo7KTP2X5vLjj5C0/i
 GGa/wHZZaPAlUFYFcpoRxDDBupa6Q5DHYCWQsjYmrPdeWMeUkFvnJPm8T0hM4aAUTFoyoc
 dmJmRJvZuPmLVemelIgO33uV2UrMiAs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-Knbd-eyrO7y2N639fFMh_A-1; Wed, 22 Mar 2023 12:10:22 -0400
X-MC-Unique: Knbd-eyrO7y2N639fFMh_A-1
Received: by mail-ed1-f70.google.com with SMTP id
 e18-20020a056402191200b004fa702d64b3so28424018edz.23
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 09:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679501421;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FIOEep8E4kG/BMmOrj58iW7bAbKFRG0g3uCHMKcBNds=;
 b=BQO/Os3QZWDnP+TeVloWovDNOd5wSIPKv4p7ajLABSIwpRIp53UTZVAANsjAArXLwa
 grbgnqxUbx0yDY5KcKFCpij3f6HF6ndSQ9YX+Uuu89uSibvqeqs5djOCWGO37frs03/N
 R3aHJerK0evmVNGo+gWoQFCemE1zDRmQet5batrARNm0Xq/JBobmC1FcxheqWdKbwP5V
 cX/96l/emamxQwrZ4Um/ACfBGJZ5kW3vDCxMtmv410DcpWH2E/Mx3ohTw0PxSUvQ4gpF
 tW8/yQWZILoeM7rt5LujVwhP98ncJ1YZ1PjYjmNQrbfPfAIXoWyPTv8UP1bIPntYdE1p
 ot6w==
X-Gm-Message-State: AO0yUKUsf/cBgtrTSLptLx72WOfX/9mI6FFzZ7ye0Ge42ZBhUJC5Ri88
 JxuCnaqtR28j6v4cLa+l1DluhQuHLzMiJo5O2hpt81ZRltMoJ+2zn9NPA+1vjkfCeu+QNLVyeQj
 yo1bxZTYvWnrRmOA=
X-Received: by 2002:aa7:db4f:0:b0:501:d3a1:9a52 with SMTP id
 n15-20020aa7db4f000000b00501d3a19a52mr7601495edt.33.1679501421194; 
 Wed, 22 Mar 2023 09:10:21 -0700 (PDT)
X-Google-Smtp-Source: AK7set9VR/P5SKTos8n7+Va6rpOfRIF5Od1pYFwpDe7ltgsSFOE/MzhS/qE/GYWBNUB+4rfVfmTgVw==
X-Received: by 2002:aa7:db4f:0:b0:501:d3a1:9a52 with SMTP id
 n15-20020aa7db4f000000b00501d3a19a52mr7601468edt.33.1679501420882; 
 Wed, 22 Mar 2023 09:10:20 -0700 (PDT)
Received: from [10.43.17.81] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 e25-20020a50d4d9000000b004c10b4f9ebesm7957679edj.15.2023.03.22.09.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 09:10:20 -0700 (PDT)
Message-ID: <a38996cb-1ca9-6bfd-3fb8-2ba037243472@redhat.com>
Date: Wed, 22 Mar 2023 17:10:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] ui/gtk: use widget size for cursor motion event
Content-Language: en-US
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20230320160856.364319-1-ernunes@redhat.com>
 <IA0PR11MB71850EDD187027261A5D260BF8819@IA0PR11MB7185.namprd11.prod.outlook.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
From: Erico Nunes <ernunes@redhat.com>
In-Reply-To: <IA0PR11MB71850EDD187027261A5D260BF8819@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ernunes@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Vivek,

On 21/03/2023 04:29, Kasireddy, Vivek wrote:
> Hi Erico,
> 
>>
>> The gd_motion_event size has some calculations for the cursor position,
>> which also take into account things like different size of the
>> framebuffer compared to the window size.
>> The use of window size makes things more difficult though, as at least
>> in the case of Wayland includes the size of ui elements like a menu bar
>> at the top of the window. This leads to a wrong position calculation by
>> a few pixels.
>> Fix it by using the size of the widget, which already returns the size
>> of the actual space to render the framebuffer.
>>
>> Signed-off-by: Erico Nunes <ernunes@redhat.com>
>> ---
>>  ui/gtk.c | 8 +++-----
>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/ui/gtk.c b/ui/gtk.c
>> index fd82e9b1ca..d1b2a80c2b 100644
>> --- a/ui/gtk.c
>> +++ b/ui/gtk.c
>> @@ -868,7 +868,6 @@ static gboolean gd_motion_event(GtkWidget *widget,
>> GdkEventMotion *motion,
>>  {
>>      VirtualConsole *vc = opaque;
>>      GtkDisplayState *s = vc->s;
>> -    GdkWindow *window;
>>      int x, y;
>>      int mx, my;
>>      int fbh, fbw;
>> @@ -881,10 +880,9 @@ static gboolean gd_motion_event(GtkWidget *widget,
>> GdkEventMotion *motion,
>>      fbw = surface_width(vc->gfx.ds) * vc->gfx.scale_x;
>>      fbh = surface_height(vc->gfx.ds) * vc->gfx.scale_y;
>>
>> -    window = gtk_widget_get_window(vc->gfx.drawing_area);
>> -    ww = gdk_window_get_width(window);
>> -    wh = gdk_window_get_height(window);
>> -    ws = gdk_window_get_scale_factor(window);
>> +    ww = gtk_widget_get_allocated_width(widget);
>> +    wh = gtk_widget_get_allocated_height(widget);
> [Kasireddy, Vivek] Could you please confirm if this works in X-based compositor
> environments as well? Last time I checked (with Fedora 36 and Gnome + X), the
> get_allocated_xxx APIs were not accurate in X-based environments. Therefore,
> I restricted the above change to Wayland-based environments only:
> https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg03100.html

Yes, I tested again and it seems to work fine for me even with the gtk
ui running on X. I'm using Fedora 37.

I was not aware of that patch series though and just spent some time
debugging these ui issues. It looks like your series was missed?

I'm still debugging additional issues with cursor position calculation,
especially in wayland environments (and in particular with
vhost-user-gpu now). Do those patches address more cursor issues?

Thank you

Erico


