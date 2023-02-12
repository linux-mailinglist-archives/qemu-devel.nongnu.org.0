Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9D56938F9
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 18:03:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRFjE-0006TV-VK; Sun, 12 Feb 2023 12:01:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pRFiy-0006N9-Oq
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 12:01:19 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pRFiu-0000oA-Sp
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 12:01:12 -0500
Received: by mail-ed1-x529.google.com with SMTP id d40so8799036eda.8
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 09:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S96u2gSAUqjBMD3ji2QlWCu+RYaoE+ZTwPZr7pq+Qow=;
 b=QJaj0b+tD+BTIon+39C5ryJPsJEpO+emv8GToh5EfYmCWO5SSiO9NYPOj0nT+tt+iw
 EJi7xoItzF2oQO63RecL/0VCioJPVMIu+tWD76cepm7J93z5npXuJj+HqRopvYrLBqE4
 6l4C7DXXqwTTvHOHR0U3Y2Ux1XUrJk9o1pE0eFa/Lxnkq1HreBWsFTuVfGQ5M86bI68n
 u1zh80MHR76qSbCiBDcUmzUqmc278g3Pbrn/4r7UTBi6xUXmcC9ruf0HJZjGCF3Zz1LY
 41nCQtYpX9p1HW753QijlDq9f8A8KvvVnbFEuxNv5qNMuGGdANlu+dCwo7kRsz6cP2PC
 1Wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S96u2gSAUqjBMD3ji2QlWCu+RYaoE+ZTwPZr7pq+Qow=;
 b=cwKfVDCR3wWUCy0noZfBJixv2FP7qC+OUFdi8I9aOh0uEBeolAvpuHtXsHDI/q1wUd
 d+fwgXr5pTKguIlHGaC06ceJ/0XYXUIe+q6WJisrMV8SBwqtRBoZSNFy27HfAQPNOTae
 +Mig5ls60mvTuloloEiKSBI2BIntCRsF9ozBHhzdKmCRB5+U6qRH8JDmS2LNtFXEsLPQ
 sSpUDj8MgkzOib38Y7okf77z5tM3uORk45s/OaC3tNo1b/e8GBiFteMa9NxwrBOyrrFt
 wzVnsOr4u7ewGEMObGuZaiI3fEZG21EhJpIBRmFlLmxGam1UueYXgFkTMUfQhNEPvETu
 VTOQ==
X-Gm-Message-State: AO0yUKX1qYoBBT92bO/wcOK5jIqclp3zbzhAsnqan47RJ10i/uMfcx3T
 g7OiwD5oNIjayTnG7KcAikG8wxv4Kzp7WZ0UlZNcWA==
X-Google-Smtp-Source: AK7set9Ht3ZsPLa48yybMEGnhEKnN54TU8P1F+3LFgp1saqFg0Anmzq/jVrHOd3YOmdwWs741/8LuJzKZ2D4TR46/q0=
X-Received: by 2002:a50:aa98:0:b0:4ac:6ad5:4138 with SMTP id
 q24-20020a50aa98000000b004ac6ad54138mr2501936edc.0.1676221265901; Sun, 12 Feb
 2023 09:01:05 -0800 (PST)
MIME-Version: 1.0
References: <20230210231829.39476-1-imp@bsdimp.com>
 <20230210231829.39476-5-imp@bsdimp.com>
 <f7a5c2d4-f8d2-9dc6-d34f-a12154dbc87e@linaro.org>
 <CANCZdfpHM8YKUqhiVx5re1c8GU-hHbiEXREz9HrmWtvOAiUUOA@mail.gmail.com>
In-Reply-To: <CANCZdfpHM8YKUqhiVx5re1c8GU-hHbiEXREz9HrmWtvOAiUUOA@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 12 Feb 2023 10:01:01 -0700
Message-ID: <CANCZdfpbw1fPXEQzXS+epVOY=TetEguC70Y5t8kaPf-G+fC13Q@mail.gmail.com>
Subject: Re: [PATCH 4/9] bsd-user: Two helper routines oidfmt and sysctl_oldcvt
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Kyle Evans <kevans@freebsd.org>, f4bug@amsat.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stacey Son <sson@freebsd.org>,
 Sean Bruno <sbruno@freebsd.org>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Raphael Kubo da Costa <rakuco@freebsd.org>
Content-Type: multipart/alternative; boundary="0000000000001e8f4005f483ad4f"
Received-SPF: none client-ip=2a00:1450:4864:20::529;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--0000000000001e8f4005f483ad4f
Content-Type: text/plain; charset="UTF-8"

Hey Richard

Thanks for the very interesting question... This kept me up...

Kyle,

Please double check what I've written below to make sure I've not missed
anything.
This might well be the source of some of the weird errors we're seeing on
some
ports, but sysctl is rare enough I'm guessing that any of the overflows are
in the
end benign.

On Sat, Feb 11, 2023 at 9:11 PM Warner Losh <imp@bsdimp.com> wrote:

>
>
> On Sat, Feb 11, 2023 at 3:17 PM Richard Henderson <
> richard.henderson@linaro.org> wrote:
>
>> On 2/10/23 13:18, Warner Losh wrote:
>> > +static int sysctl_oldcvt(void *holdp, size_t *holdlen, uint32_t kind)
>> > +{
>> > +    switch (kind & CTLTYPE) {
>> > +    case CTLTYPE_INT:
>> > +    case CTLTYPE_UINT:
>> > +        *(uint32_t *)holdp = tswap32(*(uint32_t *)holdp);
>> > +        break;
>> > +
>> > +#ifdef TARGET_ABI32
>> > +    case CTLTYPE_LONG:
>> > +    case CTLTYPE_ULONG:
>> > +        /*
>> > +         * If the sysctl has a type of long/ulong but seems to be
>> bigger than
>> > +         * these data types, its probably an array.  Double check that
>> its
>> > +         * evenly divisible by the size of long and convert holdp to a
>> series of
>> > +         * 32bit elements instead, adjusting holdlen to the new size.
>> > +         */
>> > +        if ((*holdlen > sizeof(abi_ulong)) &&
>> > +            ((*holdlen % sizeof(abi_ulong)) == 0)) {
>> > +            int array_size = *holdlen / sizeof(long);
>> > +            int i;
>> > +            if (holdp) {
>> > +                for (i = 0; i < array_size; i++) {
>> > +                    ((uint32_t *)holdp)[i] = tswap32(((long
>> *)holdp)[i]);
>> > +                }
>> > +                *holdlen = array_size * sizeof(abi_ulong);
>> > +            } else {
>> > +                *holdlen = sizeof(abi_ulong);
>> > +            }
>> > +        } else {
>> > +            *(uint32_t *)holdp = tswap32(*(long *)holdp);
>> > +            *holdlen = sizeof(uint32_t);
>>
>> This is totally confusing.  Why would it ever be an array?
>> Why is this section the only place we ever assign back into holdlen?
>>
>> Can you point to anything similar in the freebsd source?  The whole thing
>> is pretty hard
>> to track, starting from sys/kern/kern_sysctl.c.
>>
>
> I need to understand this... I've been looking for where we export an
> array, and we just don't.
>
> I've asked the original author who said it had something to do with
> different size longs. I'll
> look into that a bit and get back to this.
>
> I think we assign back into holdlen in a weird attempt adjust for the
> difference of LONG between
> the two. But I'm not sure that that's where we should assign.
>

OK. I understand what's going on. If you look at kern_sysctl.c
sysctl_old_ddb or
sbin/sysctl/sysctl.c show_var, you'll see that these values canbe arrays.
This code
only implements the array part for long and ulong, most likely because
that's
all that was encountered in the field.

 So the code is right, as far as it goes.... But if the value is bigger
than a long, it
will be truncated, which strikes me as a rather weird thing to do since
most longs
are for sizes of things, so I'd think it would be better to saturate.

We also adjust the length here because the host's memory requirements
are larger than tha targets. This also means that we're likely returning an
error for long/ulong fetches since the target would pass in 4 and the host
would want 8, and would return ENOMEM. There's no code to cope with
this at all, but I think there needs to be a temporary host buffer that's
then copied to the target buffer once it's converted. So I need to write
that code.

Also, this code doesn't handle the newer types that FreeBSD has grown
in the last few years: _{S,U}{8,16,32,64}. At least those are fixed between
the two different ABIs that freebsd supports (ILP32 and LP64).

Also, there's a size issue. *holdlen is a size_t, so we need to do a similar
brokering for ABI32 targets. The interface is such that we need to
read/write
this variable because that's what the kernel is doing (reading it to make
sure
it's big enough, and then writing it to the actual size).

Also (not relevant to this patch), we must not set sysctls very often. newp
needs similar treatment tooldp (except the reverse direction), but isn't
getting any of the tswaptreatment, so it's broken for long/ulong types as
well
as on powerpc which we have out-of-tree now and is the only big-endian
port we have left.

tl;dr: I think I'm going to have to do a bit of a rewrite here...

Warner

--0000000000001e8f4005f483ad4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey Richard</div><div><br></div><div>Thanks for the v=
ery interesting question... This kept me up...</div><div><br></div><div>Kyl=
e,</div><div><br></div><div>Please double check what I&#39;ve written below=
 to make sure I&#39;ve not missed anything.</div><div>This might well be th=
e source of some of the weird errors we&#39;re seeing on some</div><div>por=
ts, but sysctl is rare enough I&#39;m guessing that any of the overflows ar=
e in the</div><div>end benign.<br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 11, 2023 at 9:11 PM Warner Lo=
sh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Sat, Feb 11, 2023 at 3:17 PM Richard Henderson &lt;<a =
href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">richard.hend=
erson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On 2/10/23 13:18, Warner Losh wrote:<br>
&gt; +static int sysctl_oldcvt(void *holdp, size_t *holdlen, uint32_t kind)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 switch (kind &amp; CTLTYPE) {<br>
&gt; +=C2=A0 =C2=A0 case CTLTYPE_INT:<br>
&gt; +=C2=A0 =C2=A0 case CTLTYPE_UINT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *(uint32_t *)holdp =3D tswap32(*(uint32_t=
 *)holdp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +#ifdef TARGET_ABI32<br>
&gt; +=C2=A0 =C2=A0 case CTLTYPE_LONG:<br>
&gt; +=C2=A0 =C2=A0 case CTLTYPE_ULONG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If the sysctl has a type of long/=
ulong but seems to be bigger than<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* these data types, its probably an=
 array.=C2=A0 Double check that its<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* evenly divisible by the size of l=
ong and convert holdp to a series of<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 32bit elements instead, adjusting=
 holdlen to the new size.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((*holdlen &gt; sizeof(abi_ulong)) &am=
p;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((*holdlen % sizeof(abi_ulo=
ng)) =3D=3D 0)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int array_size =3D *holdlen=
 / sizeof(long);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (holdp) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0;=
 i &lt; array_size; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ((uint32_t *)holdp)[i] =3D tswap32(((long *)holdp)[i]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *holdlen =3D =
array_size * sizeof(abi_ulong);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *holdlen =3D =
sizeof(abi_ulong);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(uint32_t *)holdp =3D tswa=
p32(*(long *)holdp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *holdlen =3D sizeof(uint32_=
t);<br>
<br>
This is totally confusing.=C2=A0 Why would it ever be an array?<br>
Why is this section the only place we ever assign back into holdlen?<br>
<br>
Can you point to anything similar in the freebsd source?=C2=A0 The whole th=
ing is pretty hard <br>
to track, starting from sys/kern/kern_sysctl.c.<br></blockquote><div><br></=
div><div>I need to understand this... I&#39;ve been looking for where we ex=
port an array, and we just don&#39;t.</div><div><br></div><div>I&#39;ve ask=
ed the original author who said it had something to do with different size =
longs. I&#39;ll</div><div>look into that a bit and get back to this.</div><=
div><br></div><div>I think we assign back into holdlen=C2=A0in a weird atte=
mpt adjust for the difference of LONG between</div><div>the two. But I&#39;=
m not sure that that&#39;s where we should assign.</div></div></div></block=
quote><div><br></div><div>OK. I understand what&#39;s going on. If you look=
 at kern_sysctl.c sysctl_old_ddb or</div><div>sbin/sysctl/sysctl.c show_var=
, you&#39;ll see that these values canbe arrays. This code</div><div>only i=
mplements the array part for long and ulong, most likely because that&#39;s=
</div><div>all that was encountered in the field.</div><div><br></div><div>=
=C2=A0So the code is right, as far as it goes.... But if the value is bigge=
r than a long, it</div><div>will be truncated, which strikes me as a rather=
 weird thing to do since most longs</div><div>are for sizes of things, so I=
&#39;d think it would be better to saturate.</div><div><br></div><div>We al=
so adjust the length here because the host&#39;s memory requirements</div><=
div>are larger than tha targets. This also means that we&#39;re likely retu=
rning an</div><div>error for long/ulong fetches since the target would pass=
 in 4 and the host</div><div>would want 8, and would return ENOMEM. There&#=
39;s no code to cope with</div><div>this at all, but I think there needs to=
 be a temporary host buffer that&#39;s</div><div>then copied to the target =
buffer once it&#39;s converted. So I need to write</div><div>that code.</di=
v><div><br></div><div>Also, this code doesn&#39;t handle the newer types th=
at FreeBSD has grown</div><div>in the last few years: _{S,U}{8,16,32,64}. A=
t least those are fixed between</div><div>the two different ABIs that freeb=
sd supports (ILP32 and LP64).</div><div><br></div><div>Also, there&#39;s a =
size issue. *holdlen is a size_t, so we need to do a similar</div><div>brok=
ering for ABI32 targets. The interface is such that we need to read/write</=
div><div>this variable because that&#39;s what the kernel is doing (reading=
 it to make sure</div><div>it&#39;s big enough, and then writing it to the =
actual size).</div><div><br></div><div>Also (not relevant to this patch), w=
e must not set sysctls very often. newp</div><div>needs similar treatment t=
ooldp (except the reverse direction), but isn&#39;t</div><div>getting any o=
f the tswaptreatment, so it&#39;s broken for long/ulong types as well</div>=
<div>as on powerpc which we have out-of-tree now and is the only big-endian=
</div><div>port we have left.</div><div><br></div><div>tl;dr: I think I&#39=
;m going to have to do a bit of a rewrite here...</div><div><br></div><div>=
Warner<br></div></div></div>

--0000000000001e8f4005f483ad4f--

